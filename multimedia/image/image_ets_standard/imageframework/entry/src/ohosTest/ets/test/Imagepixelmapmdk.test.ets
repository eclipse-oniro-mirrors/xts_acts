/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import PerformanceAnalysisKitNdk from 'libentry.so'
import { taskpool } from '@kit.ArkTS'

export default function PerformanceAnalysisKit() {
  describe('PerformanceAnalysisKitTest', () => {
    /**
     * @tc.name   ImagePackerCreate001
     * @tc.number SUB_IMAGEPACKERCREATE_0100
     * @tc.desc   test IMAGEPACKERCREATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImagePackerCreate001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImagePackerCreate1()
      console.error("====>ImagePackerCreate001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   ImagePackerRelease001
     * @tc.number SUB_IMAGEPACKERRELEASE_0100
     * @tc.desc   test IMAGEPACKERRELEASE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImagePackerRelease001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImagePackerRelease()
      console.error("====>ImagePackerRelease001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   PictureMetadataCreate001
     * @tc.number SUB_PICTUREMETADATACREATE_0100
     * @tc.desc   test PICTUREMETADATACREATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PictureMetadataCreate001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PictureMetadataCreate1()
      console.error("====>PictureMetadataCreate001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   PictureMetadataCreate002
     * @tc.number SUB_PICTUREMETADATACREATE_0200
     * @tc.desc   test PICTUREMETADATACREATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PictureMetadataCreate002', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PictureMetadataCreate2()
      console.error("====>PictureMetadataCreate002 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   PictureMetadataGetProperty001
     * @tc.number SUB_PICTUREMETADAGETPROPERTY_0100
     * @tc.desc   test PICTUREMETADAGETPROPERTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PictureMetadataGetProperty001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PictureMetadataGetProperty1()
      console.error("====>PictureMetadataGetProperty001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   PictureMetadataSetProperty001
     * @tc.number SUB_PICTUREMETADASETPROPERTY_0100
     * @tc.desc   test PICTUREMETADASETPROPERTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PictureMetadataSetProperty001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PictureMetadataSetProperty1()
      console.error("====>PictureMetadataSetProperty001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   PictureMetadataRelease001
     * @tc.number SUB_PICTUREMETADARELEASE_0100
     * @tc.desc   test PICTUREMETADARELEASE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PictureMetadataRelease001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PictureMetadataRelease1()
      console.error("====>PictureMetadataRelease001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   PictureMetadataRelease002
     * @tc.number SUB_PICTUREMETADARELEASE_0200
     * @tc.desc   test PICTUREMETADARELEASE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PictureMetadataRelease002', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PictureMetadataRelease2()
      console.error("====>PictureMetadataRelease002 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   PictureMetadataClone001
     * @tc.number SUB_PICTUREMETADATACLONE_0100
     * @tc.desc   test PICTUREMETADATACLONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PictureMetadataClone001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PictureMetadataClone1()
      console.error("====>PictureMetadataClone001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   CreatePixelMapWithStride001
     * @tc.number SUB_CREATEPIXELMAPWITHSTRIDE_0100
     * @tc.desc   test CREATEPIXELMAPWITHSTRIDE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CreatePixelMapWithStride001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.CreatePixelMapWithStride()
      console.error("====>CreatePixelMapWithStride001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   CreateAlphaPixelMap001
     * @tc.number SUB_CREATEALPHAPIXELMAP_0100
     * @tc.desc   test CREATEALPHAPIXELMAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CreateAlphaPixelMap001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.CreateAlphaPixelMap()
      console.error("====>CreateAlphaPixelMap001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   GetBytesNumberPerRow001
     * @tc.number SUB_GETBYTESNUMBERPERROW_0100
     * @tc.desc   test GETBYTESNUMBERPERROW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetBytesNumberPerRow001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.GetBytesNumberPerRow()
      console.error("====>GetBytesNumberPerRow001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   GetIsEditable001
     * @tc.number SUB_GETISEDITABLE_0100
     * @tc.desc   test GETISEDITABLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetIsEditable001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.GetIsEditable()
      console.error("====>GetIsEditable001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   IsSupportAlpha001
     * @tc.number SUB_ISSUPPORTALPHA_0100
     * @tc.desc   test ISSUPPORTALPHA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IsSupportAlpha001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.IsSupportAlpha()
      console.error("====>IsSupportAlpha001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   SetAlphaAble001
     * @tc.number SUB_SETALPHAABLE_0100
     * @tc.desc   test SETALPHAABLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetAlphaAble001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetAlphaAble()
      console.error("====>SetAlphaAble001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   GetDensity001
     * @tc.number SUB_GETDENSITY_0100
     * @tc.desc   test GETDENSITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetDensity001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.GetDensity()
      console.error("====>GetDensity001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   SetDensity001
     * @tc.number SUB_SETDENSITY_0100
     * @tc.desc   test SETDENSITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetDensity001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetDensity()
      console.error("====>SetDensity001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   SetOpacity001
     * @tc.number SUB_SETOPACITY_0100
     * @tc.desc   test SETOPACITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetOpacity001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetOpacity()
      console.error("====>SetOpacity001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   PixelMapScale001
     * @tc.number SUB_PIXELMAPSCALE_0100
     * @tc.desc   test PIXELMAPSCALE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PixelMapScale001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelMapScale()
      console.error("====>PixelMapScale001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   ScaleWithAntiAliasing001
     * @tc.number SUB_SCALEWITHANTIALIASING_0100
     * @tc.desc   test SCALEWITHANTIALIASING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ScaleWithAntiAliasing001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ScaleWithAntiAliasing()
      console.error("====>ScaleWithAntiAliasing001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   PixelMapTranslate001
     * @tc.number SUB_PIXELMAPTRANSLATE_0100
     * @tc.desc   test PIXELMAPTRANSLATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PixelMapTranslate001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelMapTranslate()
      console.error("====>PixelMapTranslate001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   PixelMapRotate001
     * @tc.number SUB_PIXELMAPROTATE_0100
     * @tc.desc   test PIXELMAPROTATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PixelMapRotate001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelMapRotate()
      console.error("====>PixelMapRotate001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   PixelMapFlip001
     * @tc.number SUB_PIXELMAPFLIP_0100
     * @tc.desc   test PIXELMAPFLIP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PixelMapFlip001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelMapFlip()
      console.error("====>PixelMapFlip001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   PixelMapCrop001
     * @tc.number SUB_PIXELMAPCROP_0100
     * @tc.desc   test PIXELMAPCROP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PixelMapCrop001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelMapCrop()
      console.error("====>PixelMapCrop001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   PixelMapGetImageInfo001
     * @tc.number SUB_PIXELMAPGETIMAGEINFO_0100
     * @tc.desc   test PIXELMAPGETIMAGEINFO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PixelMapGetImageInfo001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelMapGetImageInfo()
      console.error("====>PixelMapGetImageInfo001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   PixelMapAccessPixels001
     * @tc.number SUB_PIXELMAPACCESSPIXELS_0100
     * @tc.desc   test PIXELMAPACCESSPIXELS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PixelMapAccessPixels001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelMapAccessPixels()
      console.error("====>PixelMapAccessPixels001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   PixelMapUnAccessPixels001
     * @tc.number SUB_PIXELMAPUNACCESSPIXELS_0100
     * @tc.desc   test PIXELMAPUNACCESSPIXELS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PixelMapUnAccessPixels001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelMapUnAccessPixels()
      console.error("====>PixelMapUnAccessPixels001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   UnAccessPixels001
     * @tc.number SUB_UNACCESSPIXELS_0100
     * @tc.desc   test UNACCESSPIXELS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnAccessPixels001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.UnAccessPixels()
      console.error("====>UnAccessPixels001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   GetImageInfoParameter001
     * @tc.number SUB_GETIMAGEINFOPARAMETER_0100
     * @tc.desc   test GETIMAGEINFOPARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetImageInfoParameter001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.GetImageInfoParameter()
      console.error("====>UnAccessPixels001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   GetImageInfoParameter002
     * @tc.number SUB_GETIMAGEINFOPARAMETER_0200
     * @tc.desc   test GETIMAGEINFOPARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetImageInfoParameter002', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.GetImageInfoParameter()
      console.error("====>UnAccessPixels001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   GetImageInfoParameter003
     * @tc.number SUB_GETIMAGEINFOPARAMETER_0300
     * @tc.desc   test GETIMAGEINFOPARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetImageInfoParameter003', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.GetImageInfoParameter()
      console.error("====>UnAccessPixels001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   GetImageInfoParameter004
     * @tc.number SUB_GETIMAGEINFOPARAMETER_0400
     * @tc.desc   test GETIMAGEINFOPARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetImageInfoParameter004', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.GetImageInfoParameter()
      console.error("====>UnAccessPixels001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
  })
}
