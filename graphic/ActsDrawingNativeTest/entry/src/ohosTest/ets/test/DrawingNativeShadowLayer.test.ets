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


export default function DrawingNativeShadowLayerTest() {
  describe('DrawingNativeShadowLayerTest', () => {
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
     * @tc.name   testShadowLayerCreateNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShadowLayer_0100
     * @tc.desc   test for testShadowLayerCreateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testShadowLayerCreateNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingShadowLayer(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShadowLayerCreateNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShadowLayer_0200
     * @tc.desc   test for testShadowLayerCreateNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShadowLayerCreateNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShadowLayer(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShadowLayerCreateAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShadowLayer_0300
     * @tc.desc   test for testShadowLayerCreateAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShadowLayerCreateAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShadowLayer(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShadowLayerCreateMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShadowLayer_0400
     * @tc.desc   test for testShadowLayerCreateMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShadowLayerCreateMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShadowLayer(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShadowLayerCreateMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShadowLayer_0500
     * @tc.desc   test for testShadowLayerCreateMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShadowLayerCreateMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShadowLayer(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShadowLayerDestroyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShadowLayer_0600
     * @tc.desc   test for testShadowLayerDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testShadowLayerDestroyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingShadowLayer(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShadowLayerDestroyNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShadowLayer_0700
     * @tc.desc   test for testShadowLayerDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShadowLayerDestroyNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShadowLayer(6);
      expect(result).assertEqual(0);
    })
  })
}