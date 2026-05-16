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


export default function DrawingNativeSurfaceTest() {
  describe('DrawingNativeSurfaceTest', () => {
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
     * @tc.name   testSurfaceCreateFromGpuContextNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingSurface_0100
     * @tc.desc   test for testSurfaceCreateFromGpuContextNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testSurfaceCreateFromGpuContextNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingSurface(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSurfaceCreateFromGpuContextNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingSurface_0200
     * @tc.desc   test for testSurfaceCreateFromGpuContextNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testSurfaceCreateFromGpuContextNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSurface(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSurfaceCreateFromGpuContextBoundary
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingSurface_0300
     * @tc.desc   test for testSurfaceCreateFromGpuContextBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testSurfaceCreateFromGpuContextBoundary', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingSurface(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSurfaceDestroyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingSurface_0400
     * @tc.desc   test for testSurfaceDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testSurfaceDestroyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingSurface(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSurfaceDestroyNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingSurface_0500
     * @tc.desc   test for testSurfaceDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testSurfaceDestroyNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSurface(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSurfaceGetCanvasNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingSurface_0600
     * @tc.desc   test for testSurfaceGetCanvasNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testSurfaceGetCanvasNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingSurface(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSurfaceGetCanvasNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingSurface_0700
     * @tc.desc   test for testSurfaceGetCanvasNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testSurfaceGetCanvasNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSurface(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSurfaceGetCanvasBoundary
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingSurface_0800
     * @tc.desc   test for testSurfaceGetCanvasBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testSurfaceGetCanvasBoundary', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingSurface(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSurfaceCreateOnScreenNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingSurface_0900
     * @tc.desc   test for testSurfaceCreateOnScreenNormal.window
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testSurfaceCreateOnScreenNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingSurface(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSurfaceCreateOnScreenNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingSurface_1000
     * @tc.desc   test for testSurfaceCreateOnScreenNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testSurfaceCreateOnScreenNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSurface(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSurfaceCreateOnScreenMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingSurface_1100
     * @tc.desc   test for testSurfaceCreateOnScreenMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testSurfaceCreateOnScreenMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSurface(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSurfaceFlushNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingSurface_1200
     * @tc.desc   test for testSurfaceFlushNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testSurfaceFlushNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingSurface(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSurfaceFlushNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingSurface_1300
     * @tc.desc   test for testSurfaceFlushNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testSurfaceFlushNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSurface(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSurfaceFlushAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingSurface_1400
     * @tc.desc   test for testSurfaceFlushAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testSurfaceFlushAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSurface(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSurfaceFlushMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingSurface_1500
     * @tc.desc   test for testSurfaceFlushMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testSurfaceFlushMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSurface(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSurfaceFlushTiming
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingSurface_1600
     * @tc.desc   test for testSurfaceFlushTiming.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testSurfaceFlushTiming', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSurface(15);
      expect(result).assertEqual(0);
    })
  })
}