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


export default function DrawingNativeTypefaceTest() {
  describe('DrawingNativeTypefaceTest', () => {
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
     * @tc.name   testTypefaceCreateDefaultNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTypefaceCreate_0100
     * @tc.desc   test for testTypefaceCreateDefaultNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTypefaceCreateDefaultNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTypefaceCreate(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTypefaceCreateDefaultNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTypefaceCreate_0200
     * @tc.desc   test for testTypefaceCreateDefaultNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTypefaceCreateDefaultNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTypefaceCreate(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTypefaceCreateFromFileNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTypefaceCreate_0300
     * @tc.desc   test for testTypefaceCreateFromFileNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTypefaceCreateFromFileNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTypefaceCreate(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTypefaceCreateFromFileNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTypefaceCreate_0400
     * @tc.desc   test for testTypefaceCreateFromFileNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTypefaceCreateFromFileNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTypefaceCreate(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTypefaceCreateFromStreamNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTypefaceCreate_0500
     * @tc.desc   test for testTypefaceCreateFromStreamNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTypefaceCreateFromStreamNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTypefaceCreate(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTypefaceCreateFromStreamNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTypefaceCreate_0600
     * @tc.desc   test for testTypefaceCreateFromStreamNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTypefaceCreateFromStreamNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTypefaceCreate(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTypefaceCreateDestroyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTypefaceCreate_0700
     * @tc.desc   test for testTypefaceCreateDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTypefaceCreateDestroyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTypefaceCreate(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTypefaceCreateDestroyNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTypefaceCreate_0800
     * @tc.desc   test for testTypefaceCreateDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTypefaceCreateDestroyNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTypefaceCreate(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTypefaceCreateFromFileWithArugumentsNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTypefaceCreate_0900
     * @tc.desc   test for testTypefaceCreateFromFileWithArugumentsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTypefaceCreateFromFileWithArugumentsNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTypefaceCreate(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTypefaceCreateFromFileWithArugumentsNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTypefaceCreate_1000
     * @tc.desc   test for testTypefaceCreateFromFileWithArugumentsNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTypefaceCreateFromFileWithArugumentsNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTypefaceCreate(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTypefaceCreateFromFileWithArugumentsAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTypefaceCreate_1100
     * @tc.desc   test for testTypefaceCreateFromFileWithArugumentsAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTypefaceCreateFromFileWithArugumentsAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTypefaceCreate(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTypefaceCreateFromFileWithArugumentsMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTypefaceCreate_1200
     * @tc.desc   test for testTypefaceCreateFromFileWithArugumentsMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTypefaceCreateFromFileWithArugumentsMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTypefaceCreate(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTypefaceCreateFromCurrentNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTypefaceCreate_1300
     * @tc.desc   test for testTypefaceCreateFromCurrentNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTypefaceCreateFromCurrentNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTypefaceCreate(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTypefaceCreateFromCurrentNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTypefaceCreate_1400
     * @tc.desc   test for testTypefaceCreateFromCurrentNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTypefaceCreateFromCurrentNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTypefaceCreate(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTypefaceCreateFromCurrentMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTypefaceCreate_1500
     * @tc.desc   test for testTypefaceCreateFromCurrentMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTypefaceCreateFromCurrentMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTypefaceCreate(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTypefaceIsBoldNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTypefaceIsBoldItalic_0100
     * @tc.desc   test for testTypefaceIsBoldNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTypefaceIsBoldNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTypefaceIsBoldItalic(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTypefaceIsBoldNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTypefaceIsBoldItalic_0200
     * @tc.desc   test for testTypefaceIsBoldNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTypefaceIsBoldNull', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTypefaceIsBoldItalic(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTypefaceIsBoldMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTypefaceIsBoldItalic_0300
     * @tc.desc   test for testTypefaceIsBoldMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTypefaceIsBoldMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTypefaceIsBoldItalic(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTypefaceIsItalicNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTypefaceIsBoldItalic_0400
     * @tc.desc   test for testTypefaceIsItalicNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTypefaceIsItalicNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTypefaceIsBoldItalic(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTypefaceIsItalicNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTypefaceIsBoldItalic_0500
     * @tc.desc   test for testTypefaceIsItalicNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTypefaceIsItalicNull', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTypefaceIsBoldItalic(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTypefaceIsItalicMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTypefaceIsBoldItalic_0600
     * @tc.desc   test for testTypefaceIsItalicMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTypefaceIsItalicMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTypefaceIsBoldItalic(5);
      expect(result).assertEqual(0);
    })
  })
}