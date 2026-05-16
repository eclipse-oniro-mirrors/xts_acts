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


export default function DrawingNativePixelMapTest() {
  describe('DrawingNativePixelMapTest', () => {
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
     * @tc.name   testPixelMapGetFromNativePixelMapNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPixelMap_0100
     * @tc.desc   test for testPixelMapGetFromNativePixelMapNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPixelMapGetFromNativePixelMapNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPixelMap(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPixelMapGetFromNativePixelMapNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPixelMap_0200
     * @tc.desc   test for testPixelMapGetFromNativePixelMapNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPixelMapGetFromNativePixelMapNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPixelMap(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPixelMapGetFromNativePixelMapMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPixelMap_0300
     * @tc.desc   test for testPixelMapGetFromNativePixelMapMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPixelMapGetFromNativePixelMapMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPixelMap(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPixelMapGetFromNativePixelMapBoundary
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPixelMap_0400
     * @tc.desc   test for testPixelMapGetFromNativePixelMapBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPixelMapGetFromNativePixelMapBoundary', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPixelMap(3);
      expect(result).assertEqual(0);
    })

    // PixelMap GetFromOhPixelMapNative related test cases (4 cases)
    /**
     * @tc.name   testPixelMapGetFromOhPixelMapNativeNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPixelMap_0500
     * @tc.desc   test for testPixelMapGetFromOhPixelMapNativeNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPixelMapGetFromOhPixelMapNativeNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPixelMap(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPixelMapGetFromOhPixelMapNativeNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPixelMap_0600
     * @tc.desc   test for testPixelMapGetFromOhPixelMapNativeNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPixelMapGetFromOhPixelMapNativeNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPixelMap(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPixelMapGetFromOhPixelMapNativeMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPixelMap_0700
     * @tc.desc   test for testPixelMapGetFromOhPixelMapNativeMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPixelMapGetFromOhPixelMapNativeMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPixelMap(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPixelMapGetFromOhPixelMapNativeBoundary
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPixelMap_0800
     * @tc.desc   test for testPixelMapGetFromOhPixelMapNativeBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPixelMapGetFromOhPixelMapNativeBoundary', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPixelMap(7);
      expect(result).assertEqual(0);
    })

    // PixelMap Dissolve related test cases (2 cases)
    /**
     * @tc.name   testPixelMapDissolveNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPixelMap_0900
     * @tc.desc   test for testPixelMapDissolveNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPixelMapDissolveNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPixelMap(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPixelMapDissolveNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPixelMap_1000
     * @tc.desc   test for testPixelMapDissolveNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPixelMapDissolveNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPixelMap(9);
      expect(result).assertEqual(0);
    })
  })
}