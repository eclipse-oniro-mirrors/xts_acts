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


export default function DrawingNativeImageTest() {
  describe('DrawingNativeImageTest', () => {
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
     * @tc.name   testImageCreateDestroyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImage_0100
     * @tc.desc   Test for creating and destroying an image object with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testImageCreateDestroyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingImage(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageCreateDestroyNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImage_0200
     * @tc.desc   Test for destroying an image object with a NULL parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testImageCreateDestroyNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImage(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageCreateDestroyMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImage_0300
     * @tc.desc   Test for multiple calls of creating and destroying an image object.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testImageCreateDestroyMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImage(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageBuildFromBitmapNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImage_0400
     * @tc.desc   Test for building an image from a bitmap with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testImageBuildFromBitmapNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingImage(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageBuildFromBitmapNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImage_0500
     * @tc.desc   Test for building an image from a bitmap with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testImageBuildFromBitmapNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImage(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageBuildFromBitmapMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImage_0600
     * @tc.desc   Test for multiple calls of building an image from a bitmap.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testImageBuildFromBitmapMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImage(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageBuildFromBitmapMultipleCallsBoundary
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImage_0700
     * @tc.desc   Test for multiple calls of building an boundary value image from a bitmap.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testImageBuildFromBitmapMultipleCallsBoundary', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImage(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageGetWidthHeightNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImage_0800
     * @tc.desc   Test for getting width and height of an image with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testImageGetWidthHeightNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingImage(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageGetWidthHeightNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImage_0900
     * @tc.desc   Test for getting width and height of an image with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testImageGetWidthHeightNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImage(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageGetWidthHeightMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImage_1000
     * @tc.desc   Test for multiple calls of getting width and height of an image.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testImageGetWidthHeightMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImage(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageGetWidthHeightMultipleCallsBoundary
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImage_1100
     * @tc.desc   Test for multiple calls of getting width and height of an boundary value image.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testImageGetWidthHeightMultipleCallsBoundary', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImage(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageGetImageInfoNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImage_1200
     * @tc.desc   Test for getting image info with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testImageGetImageInfoNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingImage(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageGetImageInfoNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImage_1300
     * @tc.desc   Test for getting image info with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testImageGetImageInfoNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImage(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageGetImageInfoMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImage_1400
     * @tc.desc   Test for multiple calls of getting image info.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testImageGetImageInfoMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImage(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageGetImageInfoAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImage_1500
     * @tc.desc   Test for getting image info with abnormal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testImageGetImageInfoAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImage(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageGetImageInfoMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImage_1600
     * @tc.desc   Test for getting image info with maximum values.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testImageGetImageInfoMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImage(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageGetImageInfoBoundary
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImage_1700
     * @tc.desc   Test for getting image info with Boundary value.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testImageGetImageInfoBoundary', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImage(16);
      expect(result).assertEqual(0);
    })
  })
}