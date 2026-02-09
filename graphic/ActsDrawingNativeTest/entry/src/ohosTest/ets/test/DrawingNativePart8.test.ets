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


export default function ActsNewDrawingNativeTestPart8() {
  describe('ActsNewDrawingNativeTestPart8', () => {
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
    // Pen CreateDestroy related test cases (6 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_0100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_0100
     * @tc.desc   test for TestPenCreateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_0100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenCreateDestroy(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_0200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_0200
     * @tc.desc   test for TestPenCopyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_0200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenCreateDestroy(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_0300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_0300
     * @tc.desc   test for TestPenCopyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_0300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenCreateDestroy(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_0400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_0400
     * @tc.desc   test for TestPenCopyInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_0400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenCreateDestroy(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_0500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_0500
     * @tc.desc   test for TestPenDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_0500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenCreateDestroy(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_0600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_0600
     * @tc.desc   test for TestPenDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_0600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenCreateDestroy(5);
      expect(result).assertEqual(0);
    })

    // Pen AntiAlias related test cases (4 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_0700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_0700
     * @tc.desc   test for TestPenIsAntiAliasNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_0700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenAntiAlias(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_0800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_0800
     * @tc.desc   test for TestPenIsAntiAliasNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_0800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenAntiAlias(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_0900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_0900
     * @tc.desc   test for TestPenSetAntiAliasNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_0900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenAntiAlias(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_01000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_01000
     * @tc.desc   test for TestPenSetAntiAliasNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_01000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenAntiAlias(3);
      expect(result).assertEqual(0);
    })

    // Pen Color related test cases (6 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_01100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_01100
     * @tc.desc   test for TestPenGetColorNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_01100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenColor(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_01200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_01200
     * @tc.desc   test for TestPenGetColorNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_01200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenColor(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_01300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_01300
     * @tc.desc   test for TestPenSetColorNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_01300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenColor(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_01400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_01400
     * @tc.desc   test for TestPenSetColorNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_01400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenColor(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_01500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_01500
     * @tc.desc   test for TestPenSetColorAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_01500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenColor(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_01600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_01600
     * @tc.desc   test for TestPenSetColorMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_01600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenColor(5);
      expect(result).assertEqual(0);
    })

    // Pen Alpha related test cases (6 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_01700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_01700
     * @tc.desc   test for TestPenGetAlphaNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_01700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenAlpha(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_01800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_01800
     * @tc.desc   test for TestPenGetAlphaNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_01800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenAlpha(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_01900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_01900
     * @tc.desc   test for TestPenSetAlphaNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_01900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenAlpha(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_02000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_02000
     * @tc.desc   test for TestPenSetAlphaNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_02000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenAlpha(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_02100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_02100
     * @tc.desc   test for TestPenSetAlphaAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_02100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenAlpha(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_02200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_02200
     * @tc.desc   test for TestPenSetAlphaMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_02200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenAlpha(5);
      expect(result).assertEqual(0);
    })

    // Pen Width related test cases (8 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_02300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_02300
     * @tc.desc   test for TestPenGetWidthNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_02300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenWidth(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_02400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_02400
     * @tc.desc   test for TestPenGetWidthNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_02400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenWidth(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_02500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_02500
     * @tc.desc   test for TestPenGetWidthBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_02500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenWidth(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_02600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_02600
     * @tc.desc   test for TestPenSetWidthNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_02600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenWidth(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_02700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_02700
     * @tc.desc   test for TestPenSetWidthNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_02700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenWidth(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_02800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_02800
     * @tc.desc   test for TestPenSetWidthAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_02800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenWidth(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_02900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_02900
     * @tc.desc   test for TestPenSetWidthMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_02900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenWidth(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_03000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_03000
     * @tc.desc   test for TestPenSetWidthMultipleCallsBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_03000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenWidth(7);
      expect(result).assertEqual(0);
    })

    // Pen MiterLimit related test cases (6 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_03100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_03100
     * @tc.desc   test for TestPenGetMiterLimitNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_03100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenMiterLimit(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_03200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_03200
     * @tc.desc   test for TestPenGetMiterLimitNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_03200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenMiterLimit(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_03300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_03300
     * @tc.desc   test for TestPenSetMiterLimitNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_03300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenMiterLimit(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_03400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_03400
     * @tc.desc   test for TestPenSetMiterLimitNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_03400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenMiterLimit(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_03500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_03500
     * @tc.desc   test for TestPenSetMiterLimitAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_03500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenMiterLimit(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_03600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_03600
     * @tc.desc   test for TestPenSetMiterLimitMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_03600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenMiterLimit(5);
      expect(result).assertEqual(0);
    })

    // Pen Cap related test cases (5 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_03700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_03700
     * @tc.desc   test for TestPenGetCapNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_03700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenCap(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_03800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_03800
     * @tc.desc   test for TestPenGetCapNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_03800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenCap(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_03900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_03900
     * @tc.desc   test for TestPenSetCapNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_03900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenCap(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_04000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_04000
     * @tc.desc   test for TestPenSetCapNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_04000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenCap(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_04100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_04100
     * @tc.desc   test for TestPenSetCapMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_04100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenCap(4);
      expect(result).assertEqual(0);
    })

    // Pen Join related test cases (5 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_04200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_04200
     * @tc.desc   test for TestPenGetJoinNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_04200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenJoin(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_04300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_04300
     * @tc.desc   test for TestPenGetJoinNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_04300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenJoin(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_04400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_04400
     * @tc.desc   test for TestPenSetJoinNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_04400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenJoin(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_04500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_04500
     * @tc.desc   test for TestPenSetJoinNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_04500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenJoin(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_04600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_04600
     * @tc.desc   test for TestPenSetJoinMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_04600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenJoin(4);
      expect(result).assertEqual(0);
    })

    // Pen Effects related test cases (6 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_04700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_04700
     * @tc.desc   test for TestPenSetShaderEffectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_04700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenEffects(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_04800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_04800
     * @tc.desc   test for TestPenSetShaderEffectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_04800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenEffects(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_04900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_04900
     * @tc.desc   test for TestPenSetShadowLayerNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_04900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenEffects(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_05000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_05000
     * @tc.desc   test for TestPenSetShadowLayerNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_05000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenEffects(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_07200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_07200
     * @tc.desc   test for TestPenSetPathEffectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_07200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenEffects(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_07300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_07300
     * @tc.desc   test for TestPenSetPathEffectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_07300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenEffects(5);
      expect(result).assertEqual(0);
    })

    // Pen Filter related test cases (4 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_05100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_05100
     * @tc.desc   test for TestPenSetFilterNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_05100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenFilter(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_05200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_05200
     * @tc.desc   test for TestPenSetFilterNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_05200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenFilter(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_05300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_05300
     * @tc.desc   test for TestPenGetFilterNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_05300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenFilter(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_05400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_05400
     * @tc.desc   test for TestPenGetFilterNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_05400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenFilter(3);
      expect(result).assertEqual(0);
    })

    // Pen BlendMode related test cases (2 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_05500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_05500
     * @tc.desc   test for TestPenSetBlendModeNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_05500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenBlendMode(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_05600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_05600
     * @tc.desc   test for TestPenSetBlendModeNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_05600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenBlendMode(1);
      expect(result).assertEqual(0);
    })

    // Pen GetFillPath related test cases (2 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_05700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_05700
     * @tc.desc   test for TestPenGetFillPathNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_05700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenGetFillPath(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_05800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_05800
     * @tc.desc   test for TestPenGetFillPathNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_05800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenGetFillPath(1);
      expect(result).assertEqual(0);
    })

    // Pen Reset related test cases (3 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_05900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_05900
     * @tc.desc   test for TestPenResetNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_05900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenReset(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06000
     * @tc.desc   test for TestPenResetNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenReset(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06100
     * @tc.desc   test for TestPenResetMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenReset(2);
      expect(result).assertEqual(0);
    })

    // Pen GetFloat related test cases (8 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06200
     * @tc.desc   test for TestPenGetAlphaFloatNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06200', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingPenGetFloat(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06300
     * @tc.desc   test for TestPenGetAlphaFloatAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenGetFloat(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06400
     * @tc.desc   test for TestPenGetRedFloatNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06400', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingPenGetFloat(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06500
     * @tc.desc   test for TestPenGetRedFloatAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenGetFloat(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06600
     * @tc.desc   test for TestPenGetGreenFloatNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06600', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingPenGetFloat(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06700
     * @tc.desc   test for TestPenGetGreenFloatAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenGetFloat(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06800
     * @tc.desc   test for TestPenGetBlueFloatNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06800', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingPenGetFloat(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06900
     * @tc.desc   test for TestPenGetBlueFloatAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenGetFloat(7);
      expect(result).assertEqual(0);
    })

    // Pen SetColor4f related test cases (2 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_07000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_07000
     * @tc.desc   test for TestPenSetColor4fNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_07000', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingPenSetColor4f(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_07100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_07100
     * @tc.desc   test for TestPenSetColor4fAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_07100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenSetColor4f(1);
      expect(result).assertEqual(0);
    })

    // PixelMap GetFromNativePixelMap related test cases (4 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0100
     * @tc.desc   test for TestPixelMapGetFromNativePixelMapNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPixelMap(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_01000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_01000
     * @tc.desc   test for TestPixelMapGetFromNativePixelMapNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_01000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPixelMap(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0200
     * @tc.desc   test for TestPixelMapGetFromNativePixelMapMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPixelMap(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0300
     * @tc.desc   test for TestPixelMapGetFromNativePixelMapBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPixelMap(3);
      expect(result).assertEqual(0);
    })

    // PixelMap GetFromOhPixelMapNative related test cases (4 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0400
     * @tc.desc   test for TestPixelMapGetFromOhPixelMapNativeNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPixelMap(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0500
     * @tc.desc   test for TestPixelMapGetFromOhPixelMapNativeNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPixelMap(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0600
     * @tc.desc   test for TestPixelMapGetFromOhPixelMapNativeMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPixelMap(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0700
     * @tc.desc   test for TestPixelMapGetFromOhPixelMapNativeBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPixelMap(7);
      expect(result).assertEqual(0);
    })

    // PixelMap Dissolve related test cases (2 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0800
     * @tc.desc   test for TestPixelMapDissolveNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0800', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPixelMap(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0900
     * @tc.desc   test for TestPixelMapDissolveNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPixelMap(9);
      expect(result).assertEqual(0);
    })

    // Rect Create/Destroy/Copy/Intersect/Join related test cases (9 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0100
     * @tc.desc   test for TestRectCreateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectCreateDestroyIntersectJoin(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0200
     * @tc.desc   test for TestRectIntersectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectCreateDestroyIntersectJoin(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0300
     * @tc.desc   test for TestRectIntersectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectCreateDestroyIntersectJoin(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0400
     * @tc.desc   test for TestRectJoinNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectCreateDestroyIntersectJoin(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0500
     * @tc.desc   test for TestRectJoinNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectCreateDestroyIntersectJoin(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3500
     * @tc.desc   test for TestRectCopyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectCreateDestroyIntersectJoin(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3600
     * @tc.desc   test for TestRectCopyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectCreateDestroyIntersectJoin(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3700
     * @tc.desc   test for TestRectDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectCreateDestroyIntersectJoin(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3800
     * @tc.desc   test for TestRectDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectCreateDestroyIntersectJoin(8);
      expect(result).assertEqual(0);
    })

    // Rect Set/Get Left/Top/Right/Bottom related test cases (24 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0600
     * @tc.desc   test for TestRectSetLeftNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0700
     * @tc.desc   test for TestRectSetLeftNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0800
     * @tc.desc   test for TestRectSetLeftAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0900
     * @tc.desc   test for TestRectSetLeftMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1000
     * @tc.desc   test for TestRectSetTopNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1100
     * @tc.desc   test for TestRectSetTopNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1200
     * @tc.desc   test for TestRectSetTopAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1300
     * @tc.desc   test for TestRectSetTopMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1400
     * @tc.desc   test for TestRectSetRightNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1500
     * @tc.desc   test for TestRectSetRightNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1600
     * @tc.desc   test for TestRectSetRightAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1700
     * @tc.desc   test for TestRectSetRightMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1800
     * @tc.desc   test for TestRectSetBottomNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1800', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1900
     * @tc.desc   test for TestRectSetBottomNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2000
     * @tc.desc   test for TestRectSetBottomAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2100
     * @tc.desc   test for TestRectSetBottomMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2200
     * @tc.desc   test for TestRectGetLeftNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2300
     * @tc.desc   test for TestRectGetLeftNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2400
     * @tc.desc   test for TestRectGetTopNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(18);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2500
     * @tc.desc   test for TestRectGetTopNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(19);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2600
     * @tc.desc   test for TestRectGetRightNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(20);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2700
     * @tc.desc   test for TestRectGetRightNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(21);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2800
     * @tc.desc   test for TestRectGetBottomNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2800', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(22);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2900
     * @tc.desc   test for TestRectGetBottomNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(23);
      expect(result).assertEqual(0);
    })

    // Rect GetWidth/GetHeight related test cases (5 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3000
     * @tc.desc   test for TestRectGetHeightNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectOtherOperations(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3100
     * @tc.desc   test for TestRectGetHeightNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectOtherOperations(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3200
     * @tc.desc   test for TestRectGetWidthNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectOtherOperations(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3300
     * @tc.desc   test for TestRectGetWidthNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectOtherOperations(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3400
     * @tc.desc   test for TestRectGetWidthBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectOtherOperations(4);
      expect(result).assertEqual(0);
    })

  })
}
