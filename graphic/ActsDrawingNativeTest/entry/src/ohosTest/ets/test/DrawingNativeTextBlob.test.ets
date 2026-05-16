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


export default function DrawingNativeTextBlobTest() {
  describe('DrawingNativeTextBlobTest', () => {
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
     * @tc.name   testTextBlobBuilderCreateDestroyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTextBlobBuilder_0100
     * @tc.desc   test for testTextBlobBuilderCreateDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTextBlobBuilderCreateDestroyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTextBlobBuilder(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTextBlobBuilderCreateDestroyNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTextBlobBuilder_0200
     * @tc.desc   test for testTextBlobBuilderCreateDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTextBlobBuilderCreateDestroyNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobBuilder(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTextBlobBuilderCreateDestroyMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTextBlobBuilder_0300
     * @tc.desc   test for testTextBlobBuilderCreateDestroyMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTextBlobBuilderCreateDestroyMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobBuilder(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTextBlobCreateFromTextNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTextBlobCreate_0100
     * @tc.desc   test for testTextBlobCreateFromTextNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTextBlobCreateFromTextNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTextBlobCreate(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTextBlobCreateFromTextNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTextBlobCreate_0200
     * @tc.desc   test for testTextBlobCreateFromTextNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTextBlobCreateFromTextNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobCreate(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTextBlobCreateFromTextMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTextBlobCreate_0300
     * @tc.desc   test for testTextBlobCreateFromTextMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTextBlobCreateFromTextMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobCreate(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTextBlobCreateFromTextAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTextBlobCreate_0400
     * @tc.desc   test for testTextBlobCreateFromTextAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTextBlobCreateFromTextAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobCreate(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTextBlobCreateFromPosTextNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTextBlobCreate_0500
     * @tc.desc   test for testTextBlobCreateFromPosTextNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTextBlobCreateFromPosTextNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTextBlobCreate(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTextBlobCreateFromPosTextNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTextBlobCreate_0600
     * @tc.desc   test for testTextBlobCreateFromPosTextNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTextBlobCreateFromPosTextNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobCreate(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTextBlobCreateFromPosTextMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTextBlobCreate_0700
     * @tc.desc   test for testTextBlobCreateFromPosTextMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTextBlobCreateFromPosTextMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobCreate(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTextBlobCreateFromPosTextAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTextBlobCreate_0800
     * @tc.desc   test for testTextBlobCreateFromPosTextAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTextBlobCreateFromPosTextAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobCreate(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTextBlobCreateFromStringNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTextBlobCreate_0900
     * @tc.desc   test for testTextBlobCreateFromStringNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTextBlobCreateFromStringNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTextBlobCreate(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTextBlobCreateFromStringNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTextBlobCreate_1000
     * @tc.desc   test for testTextBlobCreateFromStringNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTextBlobCreateFromStringNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobCreate(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTextBlobCreateFromStringMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTextBlobCreate_1100
     * @tc.desc   test for testTextBlobCreateFromStringMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTextBlobCreateFromStringMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobCreate(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTextBlobCreateFromStringAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTextBlobCreate_1200
     * @tc.desc   test for testTextBlobCreateFromStringAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTextBlobCreateFromStringAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobCreate(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTextBlobGetBoundsNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTextBlobOther_0100
     * @tc.desc   test for testTextBlobGetBoundsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTextBlobGetBoundsNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTextBlobOther(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTextBlobGetBoundsNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTextBlobOther_0200
     * @tc.desc   test for testTextBlobGetBoundsNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTextBlobGetBoundsNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobOther(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTextBlobGetBoundsMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTextBlobOther_0300
     * @tc.desc   test for testTextBlobGetBoundsMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTextBlobGetBoundsMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobOther(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTextBlobGetBoundsAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTextBlobOther_0400
     * @tc.desc   test for testTextBlobGetBoundsAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTextBlobGetBoundsAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobOther(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTextBlobUniqueIDNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTextBlobOther_0500
     * @tc.desc   test for testTextBlobUniqueIDNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTextBlobUniqueIDNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTextBlobOther(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTextBlobUniqueIDNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTextBlobOther_0600
     * @tc.desc   test for testTextBlobUniqueIDNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTextBlobUniqueIDNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobOther(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTextBlobUniqueIDMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTextBlobOther_0700
     * @tc.desc   test for testTextBlobUniqueIDMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTextBlobUniqueIDMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobOther(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTextBlobBuilderAllocRunPosNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTextBlobBuilder_0400
     * @tc.desc   test for testTextBlobBuilderAllocRunPosNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTextBlobBuilderAllocRunPosNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTextBlobBuilder(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTextBlobBuilderAllocRunPosNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTextBlobBuilder_0500
     * @tc.desc   test for testTextBlobBuilderAllocRunPosNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTextBlobBuilderAllocRunPosNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobBuilder(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTextBlobBuilderAllocRunPosMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTextBlobBuilder_0600
     * @tc.desc   test for testTextBlobBuilderAllocRunPosMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTextBlobBuilderAllocRunPosMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobBuilder(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTextBlobBuilderMakeNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTextBlobBuilder_0700
     * @tc.desc   test for testTextBlobBuilderMakeNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTextBlobBuilderMakeNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTextBlobBuilder(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTextBlobBuilderMakeNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTextBlobBuilder_0800
     * @tc.desc   test for testTextBlobBuilderMakeNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTextBlobBuilderMakeNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobBuilder(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTextBlobBuilderMakeMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTextBlobBuilder_0900
     * @tc.desc   test for testTextBlobBuilderMakeMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTextBlobBuilderMakeMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobBuilder(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTextBlobDestroyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTextBlobOther_0800
     * @tc.desc   test for testTextBlobDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTextBlobDestroyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTextBlobOther(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testTextBlobDestroyNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingTextBlobOther_0900
     * @tc.desc   test for testTextBlobDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTextBlobDestroyNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobOther(8);
      expect(result).assertEqual(0);
    })
  })
}