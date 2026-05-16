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


export default function DrawingNativeRoundRectTest() {
  describe('DrawingNativeRoundRectTest', () => {
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
     * @tc.name   testRoundRectCreateNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRoundRect_0100
     * @tc.desc   test for testRoundRectCreateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRoundRectCreateNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRoundRect(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRoundRectCreateNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRoundRect_0200
     * @tc.desc   test for testRoundRectCreateNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRoundRectCreateNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRoundRect(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRoundRectCreateAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRoundRect_0300
     * @tc.desc   test for testRoundRectCreateAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRoundRectCreateAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRoundRect(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRoundRectCreateMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRoundRect_0400
     * @tc.desc   test for testRoundRectCreateMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRoundRectCreateMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRoundRect(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRoundRectCreateMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRoundRect_0500
     * @tc.desc   test for testRoundRectCreateMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRoundRectCreateMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRoundRect(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRoundRectSetGetCornerNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRoundRect_0600
     * @tc.desc   test for testRoundRectSetGetCornerNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRoundRectSetGetCornerNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRoundRect(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRoundRectSetGetCornerNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRoundRect_0700
     * @tc.desc   test for testRoundRectSetGetCornerNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRoundRectSetGetCornerNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRoundRect(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRoundRectSetGetCornerAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRoundRect_0800
     * @tc.desc   test for testRoundRectSetGetCornerAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRoundRectSetGetCornerAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRoundRect(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRoundRectSetGetCornerMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRoundRect_0900
     * @tc.desc   test for testRoundRectSetGetCornerMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRoundRectSetGetCornerMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRoundRect(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRoundRectSetGetCornerMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRoundRect_1000
     * @tc.desc   test for testRoundRectSetGetCornerMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRoundRectSetGetCornerMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRoundRect(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRoundRectGetCornerWhenNoSet
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRoundRect_1100
     * @tc.desc   test for testRoundRectGetCornerWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testRoundRectGetCornerWhenNoSet', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingRoundRect(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRoundRectDestroyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRoundRect_1200
     * @tc.desc   test for testRoundRectDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRoundRectDestroyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRoundRect(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRoundRectDestroyNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRoundRect_1300
     * @tc.desc   test for testRoundRectDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRoundRectDestroyNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRoundRect(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRoundRectOffsetNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRoundRect_1400
     * @tc.desc   test for testRoundRectOffsetNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRoundRectOffsetNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRoundRect(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRoundRectOffsetNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRoundRect_1500
     * @tc.desc   test for testRoundRectOffsetNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRoundRectOffsetNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRoundRect(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRoundRectOffsetMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRoundRect_1600
     * @tc.desc   test for testRoundRectOffsetMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRoundRectOffsetMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRoundRect(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRoundRectCopyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRoundRect_1700
     * @tc.desc   test for testRoundRectCopyNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRoundRectCopyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRoundRect(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRoundRectCopyNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRoundRect_1800
     * @tc.desc   test for testRoundRectCopyNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRoundRectCopyNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRoundRect(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRoundRectCopyMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRoundRect_1900
     * @tc.desc   test for testRoundRectCopyMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRoundRectCopyMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRoundRect(18);
      expect(result).assertEqual(0);
    })
  })
}