/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import nativeEffectNdk from 'libnativeEffectNdk.so';

export default function nativeEffectTest() {
  describe('NativeEffectTest', () => {
    /**
     * @tc.name   testOHFilterCreateEffect
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_EFFECT_KIT_OH_FilterCreateEffect
     * @tc.desc   test OH_Filter_Create_Effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHFilterCreateEffect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeEffectNdk.oHFilterCreateEffect();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHFilterCreateEffect001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_EFFECT_KIT_OH_FilterCreateEffect001
     * @tc.desc   test OH_Filter_Create_Effect001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHFilterCreateEffect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeEffectNdk.oHFilterCreateEffect001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHFilterInvert
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_EFFECT_KIT_OH_FilterInvert
     * @tc.desc   test OH_Filter_Invert
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHFilterInvert', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeEffectNdk.oHFilterInvert();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHFilterInvert001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_EFFECT_KIT_OH_FilterInvert001
     * @tc.desc   test OH_Filter_Invert001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHFilterInvert001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeEffectNdk.oHFilterInvert001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHFilterBlur
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_EFFECT_KIT_OH_FilterBlur
     * @tc.desc   test OH_Filter_Blur
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHFilterBlur', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeEffectNdk.oHFilterBlur();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHFilterBlur001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_EFFECT_KIT_OH_FilterBlur001
     * @tc.desc   test OH_Filter_Blur001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHFilterBlur001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeEffectNdk.oHFilterBlur001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHFilterGrayScale
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_EFFECT_KIT_OH_FilterGrayScale
     * @tc.desc   test OH_Filter_Gray_Scale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHFilterGrayScale', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeEffectNdk.oHFilterGrayScale();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHFilterGrayScale001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_EFFECT_KIT_OH_FilterGrayScale001
     * @tc.desc   test OH_Filter_Gray_Scale001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHFilterGrayScale001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeEffectNdk.oHFilterGrayScale001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHFilterBrighten
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_EFFECT_KIT_OH_FilterBrighten
     * @tc.desc   test OH_Filter_Brighten
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHFilterBrighten', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeEffectNdk.oHFilterBrighten();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHFilterBrighten001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_EFFECT_KIT_OH_FilterBrighten001
     * @tc.desc   test OH_Filter_Brighten001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHFilterBrighten001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeEffectNdk.oHFilterBrighten001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHFilterSetColorMatrix
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_EFFECT_KIT_OH_FilterSetColorMatrix
     * @tc.desc   test OH_Filter_Set_Color_Matrix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHFilterSetColorMatrix', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeEffectNdk.oHFilterSetColorMatrix();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHFilterSetColorMatrix001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_EFFECT_KIT_OH_FilterSetColorMatrix001
     * @tc.desc   test OH_Filter_Set_Color_Matrix001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHFilterSetColorMatrix001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeEffectNdk.oHFilterSetColorMatrix001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHFilterGetEffectPixelMap
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_EFFECT_KIT_OH_FilterGetEffectPixelMap
     * @tc.desc   test OH_Filter_Get_Effect_PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHFilterGetEffectPixelMap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeEffectNdk.oHFilterGetEffectPixelMap();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHFilterRelease
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_EFFECT_KIT_OH_FilterRelease
     * @tc.desc   test OH_Filter_Release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHFilterRelease', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeEffectNdk.oHFilterRelease();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHFilterRelease001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_EFFECT_KIT_OH_FilterRelease001
     * @tc.desc   test OH_Filter_Release001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHFilterRelease001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeEffectNdk.oHFilterRelease001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHFilterBlurWithTileMode001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_EFFECT_KIT_OH_FilterBlurWithTileMode001
     * @tc.desc   test OH_Filter_BlurWithTileMode001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHFilterBlurWithTileMode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeEffectNdk.oHFilterBlurWithTileMode001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHPixelmapNativeCreateScaledPixelMap001
     * @tc.number SUB_GRAPHIC_XTS_OH_PixelmapNative_CreateScaledPixelMap001
     * @tc.desc   test OH_PixelmapNative_CreateScaledPixelMap001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHPixelmapNativeCreateScaledPixelMap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeEffectNdk.oHPixelmapNativeCreateScaledPixelMap001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHPixelmapNativeCreateScaledPixelMapWithAntiAliasing001
     * @tc.number SUB_GRAPHIC_XTS_OH_PixelmapNative_CreateScaledPixelMapWithAntiAliasing001
     * @tc.desc   test OH_PixelmapNative_CreateScaledPixelMapWithAntiAliasing001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHPixelmapNativeCreateScaledPixelMapWithAntiAliasing001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeEffectNdk.oHPixelmapNativeCreateScaledPixelMapWithAntiAliasing001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHPixelmapNativeGetByteCount001
     * @tc.number SUB_GRAPHIC_XTS_OH_PixelmapNative_GetByteCount001
     * @tc.desc   test OH_PixelmapNative_GetByteCount001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHPixelmapNativeGetByteCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeEffectNdk.oHPixelmapNativeGetByteCount001();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHPixelmapNativeAccessPixels001
     * @tc.number SUB_GRAPHIC_XTS_OH_PixelmapNative_AccessPixels001
     * @tc.desc   test OH_PixelmapNative_AccessPixels001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHPixelmapNativeAccessPixels001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeEffectNdk.oHPixelmapNativeAccessPixels001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHPixelmapNativeUnaccessPixels001
     * @tc.number SUB_GRAPHIC_XTS_OH_PixelmapNative_UnaccessPixels001
     * @tc.desc   test OH_PixelmapNative_UnaccessPixels001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHPixelmapNativeUnaccessPixels001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeEffectNdk.oHPixelmapNativeUnaccessPixels001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHPixelmapInitializationOptionsEditable001
     * @tc.number SUB_GRAPHIC_XTS_OH_PixelmapInitializationOptions_Editable001
     * @tc.desc   test OH_PixelmapInitializationOptions_Editable001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHPixelmapInitializationOptionsEditable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeEffectNdk.oHPixelmapInitializationOptionsEditable001();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHPixelmapNativeDestroy001
     * @tc.number SUB_GRAPHIC_XTS_OH_OH_PixelmapNative_Destroy001
     * @tc.desc   test OH_PixelmapNative_Destroy001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHPixelmapNativeDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeEffectNdk.oHPixelmapNativeDestroy001();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHPixelmapImageInfoGetAlphaMode001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_PixelmapImageInfo_GetAlphaMode_001
     * @tc.desc   test PixelmapImageInfo_GetAlphaMode_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHPixelmapImageInfoGetAlphaMode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeEffectNdk.oHPixelmapImageInfoGetAlphaMode001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHPixelmapNativeCreatePixelmapUsingAllocator001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_PixelmapNative_CreatePixelmapUsingAllocator_001
     * @tc.desc   test PixelmapNative_CreatePixelmapUsingAllocator_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHPixelmapNativeCreatePixelmapUsingAllocator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeEffectNdk.oHPixelmapNativeCreatePixelmapUsingAllocator001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHPixelmapNativeCreateEmptyPixelmapUsingAllocator001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_PixelmapNative_CreateEmptyPixelmapUsingAllocator_001
     * @tc.desc   test PixelmapNative_CreateEmptyPixelmapUsingAllocator_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHPixelmapNativeCreateEmptyPixelmapUsingAllocator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeEffectNdk.oHPixelmapNativeCreateEmptyPixelmapUsingAllocator001();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHEffectUnsupportedOperation001
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Effect_OHEffectUnsupportedOperation001
    * @tc.desc   test OHEffectUnsupportedOperation001
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHEffectUnsupportedOperation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeEffectNdk.oHEffectUnsupportedOperation001();
      expect(result).assertEqual(0);
      done();
    });

  })
}