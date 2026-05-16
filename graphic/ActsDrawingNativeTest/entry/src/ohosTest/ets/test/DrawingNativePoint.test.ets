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


export default function DrawingNativePointTest() {
  describe('DrawingNativePointTest', () => {
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
     * @tc.name   testPointCreateNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPointCreate_0100
     * @tc.desc   test for testPointCreateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPointCreateNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPointCreate(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPointCreateNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPointCreate_0200
     * @tc.desc   test for testPointCreateNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPointCreateNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPointCreate(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPointCreateAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPointCreate_0300
     * @tc.desc   test for testPointCreateAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPointCreateAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPointCreate(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPointCreateMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPointCreate_0400
     * @tc.desc   test for testPointCreateMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPointCreateMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPointCreate(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPointCreateMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPointCreate_0500
     * @tc.desc   test for testPointCreateMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPointCreateMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPointCreate(4);
      expect(result).assertEqual(0);
    })

    // Point Destroy related test cases
    /**
     * @tc.name   testPointDestroyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPointDestroy_0100
     * @tc.desc   test for testPointDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPointDestroyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPointDestroy(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPointDestroyNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPointDestroy_0200
     * @tc.desc   test for testPointDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPointDestroyNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPointDestroy(1);
      expect(result).assertEqual(0);
    })

    // Point GetSet related test cases
    /**
     * @tc.name   testPointGetXNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPointGetSet_0100
     * @tc.desc   test for testPointGetXNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPointGetXNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPointGetSet(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPointGetXNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPointGetSet_0200
     * @tc.desc   test for testPointGetXNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPointGetXNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPointGetSet(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPointGetXMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPointGetSet_0300
     * @tc.desc   test for testPointGetXMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPointGetXMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPointGetSet(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPointGetYNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPointGetSet_0400
     * @tc.desc   test for testPointGetYNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPointGetYNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPointGetSet(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPointGetYNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPointGetSet_0500
     * @tc.desc   test for testPointGetYNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPointGetYNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPointGetSet(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPointGetYMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPointGetSet_0600
     * @tc.desc   test for testPointGetYMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPointGetYMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPointGetSet(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPointSetNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPointGetSet_0700
     * @tc.desc   test for testPointSetNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPointSetNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPointGetSet(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPointSetNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPointGetSet_0800
     * @tc.desc   test for testPointSetNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPointSetNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPointGetSet(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPointSetMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPointGetSet_0900
     * @tc.desc   test for testPointSetMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPointSetMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPointGetSet(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPointNegateNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPointNegateOffset_0100
     * @tc.desc   test for testPointNegateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPointNegateNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPointNegateOffset(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPointNegateNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPointNegateOffset_0200
     * @tc.desc   test for testPointNegateNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPointNegateNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPointNegateOffset(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPointNegateMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPointNegateOffset_0300
     * @tc.desc   test for testPointNegateMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPointNegateMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPointNegateOffset(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPointOffsetNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPointNegateOffset_0400
     * @tc.desc   test for testPointOffsetNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPointOffsetNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPointNegateOffset(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPointOffsetNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPointNegateOffset_0500
     * @tc.desc   test for testPointOffsetNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPointOffsetNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPointNegateOffset(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPointOffsetMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPointNegateOffset_0600
     * @tc.desc   test for testPointOffsetMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPointOffsetMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPointNegateOffset(5);
      expect(result).assertEqual(0);
    })
  })
}