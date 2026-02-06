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
  describe('imageframework', () => {
    /*
* @tc.number     : SUB_PIXELMAPNATIVEOPACITYSUCCESS_0100
* @tc.name       : PixelmapNativeOpacitySuccess001
* @tc.desc       : test PIXELMAPNATIVEOPACITYSUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeOpacitySuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeOpacitySuccess()
      console.error("====>PixelmapNativeOpacitySuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVEOPACITY_0100
* @tc.name       : PixelmapNativeOpacity001
* @tc.desc       : test PIXELMAPNATIVEOPACITY
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeOpacity001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeOpacity()
      console.error("====>PixelmapNativeOpacity001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVESCALESUCCESS_0100
* @tc.name       : PixelmapNativeScaleSuccess001
* @tc.desc       : test PIXELMAPNATIVESCALESUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeScaleSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeScaleSuccess()
      console.error("====>PixelmapNativeScaleSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVESCALE_0100
* @tc.name       : PixelmapNativeScale001
* @tc.desc       : test PIXELMAPNATIVESCALE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeScale001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeScale()
      console.error("====>PixelmapNativeScale001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVESCALEWITHANTIALIASING_0100
* @tc.name       : PixelmapNativeScaleWithAntiAliasing001
* @tc.desc       : test PIXELMAPNATIVESCALEWITHANTIALIASING
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeScaleWithAntiAliasing001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeScaleWithAntiAliasing()
      console.error("====>PixelmapNativeScaleWithAntiAliasing001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_CREATESCALEDPIXELMAP_0100
* @tc.name       : CreateScaledPixelMap001
* @tc.desc       : test CREATESCALEDPIXELMAP
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('CreateScaledPixelMap001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.CreateScaledPixelMap()
      console.error("====>CreateScaledPixelMap001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_TRANSLATE_0100
* @tc.name       : Translate001
* @tc.desc       : test TRANSLATE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('Translate001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.Translate()
      console.error("====>Translate001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVEROTATESUCCESS_0100
* @tc.name       : PixelmapNativeRotateSuccess001
* @tc.desc       : test PIXELMAPNATIVEROTATESUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeRotateSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeRotateSuccess()
      console.error("====>PixelmapNativeRotateSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVEROTATE_0100
* @tc.name       : PixelmapNativeRotate001
* @tc.desc       : test PIXELMAPNATIVEROTATE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeRotate001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeRotate()
      console.error("====>PixelmapNativeRotate001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVEFLIPSUCCESS_0100
* @tc.name       : PixelmapNativeFlipSuccess001
* @tc.desc       : test PIXELMAPNATIVEFLIPSUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeFlipSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeFlipSuccess()
      console.error("====>PixelmapNativeFlipSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVEFLIP_0100
* @tc.name       : PixelmapNativeFlip001
* @tc.desc       : test PIXELMAPNATIVEFLIP
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeFlip001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeFlip()
      console.error("====>PixelmapNativeFlip001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVECROP_0100
* @tc.name       : PixelmapNativeCrop001
* @tc.desc       : test PIXELMAPNATIVECROP
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeCrop001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeCrop()
      console.error("====>PixelmapNativeCrop001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVERELEASESUCCESS_0100
* @tc.name       : PixelmapNativeReleaseSuccess001
* @tc.desc       : test PIXELMAPNATIVERELEASESUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeReleaseSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeReleaseSuccess()
      console.error("====>PixelmapNativeReleaseSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVERELEASE_0100
* @tc.name       : PixelmapNativeRelease001
* @tc.desc       : test PIXELMAPNATIVERELEASE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeRelease001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeRelease()
      console.error("====>PixelmapNativeRelease001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_CREATESCALEDPIXELMAPWITHANTIALIASING_0100
* @tc.name       : CreateScaledPixelMapWithAntiAliasing001
* @tc.desc       : test CREATESCALEDPIXELMAPWITHANTIALIASING
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('CreateScaledPixelMapWithAntiAliasing001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.CreateScaledPixelMapWithAntiAliasing()
      console.error("====>CreateScaledPixelMapWithAntiAliasing001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVEDESTROYSUCCESS_0100
* @tc.name       : PixelmapNativeDestroySuccess001
* @tc.desc       : test PIXELMAPNATIVEDESTROYSUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeDestroySuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeDestroySuccess()
      console.error("====>PixelmapNativeDestroySuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVEDESTROY_0100
* @tc.name       : PixelmapNativeDestroy001
* @tc.desc       : test PIXELMAPNATIVEDESTROY
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeDestroy001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeDestroy()
      console.error("====>PixelmapNativeDestroy001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVECONVERTALPHAFORMAT_0100
* @tc.name       : PixelmapNativeConvertAlphaFormat001
* @tc.desc       : test PIXELMAPNATIVECONVERTALPHAFORMAT
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeConvertAlphaFormat001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeConvertAlphaFormat()
      console.error("====>PixelmapNativeConvertAlphaFormat001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVECREATEEMPTYPIXELMAPSUCCESS_0100
* @tc.name       : PixelmapNativeCreateEmptyPixelmapSuccess001
* @tc.desc       : test PIXELMAPNATIVECREATEEMPTYPIXELMAPSUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeCreateEmptyPixelmapSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeCreateEmptyPixelmapSuccess()
      console.error("====>PixelmapNativeCreateEmptyPixelmapSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVECREATEEMPTYPIXELMAP_0100
* @tc.name       : PixelmapNativeCreateEmptyPixelmap001
* @tc.desc       : test PIXELMAPNATIVECREATEEMPTYPIXELMAP
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeCreateEmptyPixelmap001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeCreateEmptyPixelmap()
      console.error("====>PixelmapNativeCreateEmptyPixelmap001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVECREATEEMPTYPIXELMAPUSINGALLOCATOR_0100
* @tc.name       : PixelmapNativeCreateEmptyPixelmapUsingAllocator001
* @tc.desc       : test PIXELMAPNATIVECREATEEMPTYPIXELMAPUSINGALLOCATOR
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeCreateEmptyPixelmapUsingAllocator001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeCreateEmptyPixelmapUsingAllocator()
      console.error("====>PixelmapNativeCreateEmptyPixelmapUsingAllocator001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVEGETMETADATA_0100
* @tc.name       : PixelmapNativeGetMetadata001
* @tc.desc       : test PIXELMAPNATIVEGETMETADATA
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeGetMetadata001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeGetMetadata()
      console.error("====>PixelmapNativeGetMetadata001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVESETMETADATA_0100
* @tc.name       : PixelmapNativeSetMetadata001
* @tc.desc       : test PIXELMAPNATIVESETMETADATA
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeSetMetadata001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeSetMetadata()
      console.error("====>PixelmapNativeSetMetadata001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVEGETNATIVEBUFFER_0100
* @tc.name       : PixelmapNativeGetNativeBuffer001
* @tc.desc       : test PIXELMAPNATIVEGETNATIVEBUFFER
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeGetNativeBuffer001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeGetNativeBuffer()
      console.error("====>PixelmapNativeGetNativeBuffer001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVEGETCOLORSPACENATIVE_0100
* @tc.name       : PixelmapNativeGetColorSpaceNative001
* @tc.desc       : test PIXELMAPNATIVEGETCOLORSPACENATIVE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeGetColorSpaceNative001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeGetColorSpaceNative()
      console.error("====>PixelmapNativeGetColorSpaceNative001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVESETCOLORSPACENATIVE_0100
* @tc.name       : PixelmapNativeSetColorSpaceNative001
* @tc.desc       : test PIXELMAPNATIVESETCOLORSPACENATIVE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeSetColorSpaceNative001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeSetColorSpaceNative()
      console.error("====>PixelmapNativeSetColorSpaceNative001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    9
    /*
* @tc.number     : SUB_PIXELMAPNATIVESETMEMORYNAME_0100
* @tc.name       : PixelmapNativeSetMemoryName001
* @tc.desc       : test PIXELMAPNATIVESETMEMORYNAME
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeSetMemoryName001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeSetMemoryName()
      console.error("====>PixelmapNativeSetMemoryName001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVEGETBYTECOUNTSUCCESS_0100
* @tc.name       : PixelmapNativeGetByteCountSuccess001
* @tc.desc       : test PIXELMAPNATIVEGETBYTECOUNTSUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeGetByteCountSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeGetByteCountSuccess()
      console.error("====>PixelmapNativeGetByteCountSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVEGETBYTECOUNT_0100
* @tc.name       : PixelmapNativeGetByteCount001
* @tc.desc       : test PIXELMAPNATIVEGETBYTECOUNT
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeGetByteCount001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeGetByteCount()
      console.error("====>PixelmapNativeGetByteCount001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVEGETALLOCATIONBYTECOUNTSUCCESS_0100
* @tc.name       : PixelmapNativeGetAllocationByteCountSuccess001
* @tc.desc       : test PIXELMAPNATIVEGETALLOCATIONBYTECOUNTSUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeGetAllocationByteCountSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeGetAllocationByteCountSuccess()
      console.error("====>PixelmapNativeGetAllocationByteCountSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVEGETALLOCATIONBYTECOUNT_0100
* @tc.name       : PixelmapNativeGetAllocationByteCount001
* @tc.desc       : test PIXELMAPNATIVEGETALLOCATIONBYTECOUNT
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeGetAllocationByteCount001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeGetAllocationByteCount()
      console.error("====>PixelmapNativeGetAllocationByteCount001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVEACCESSPIXELSSUCCESS_0100
* @tc.name       : PixelmapNativeAccessPixelsSuccess001
* @tc.desc       : test PIXELMAPNATIVEACCESSPIXELSSUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeAccessPixelsSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeAccessPixelsSuccess()
      console.error("====>PixelmapNativeAccessPixelsSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVEACCESSPIXELS_0100
* @tc.name       : PixelmapNativeAccessPixels001
* @tc.desc       : test PIXELMAPNATIVEACCESSPIXELS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeAccessPixels001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeAccessPixels()
      console.error("====>PixelmapNativeAccessPixels001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVEUNACCESSPIXELSSUCCESS_0100
* @tc.name       : PixelmapNativeUnaccessPixelsSuccess001
* @tc.desc       : test PIXELMAPNATIVEUNACCESSPIXELSSUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeUnaccessPixelsSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeUnaccessPixelsSuccess()
      console.error("====>PixelmapNativeUnaccessPixelsSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVEUNACCESSPIXELS_0100
* @tc.name       : PixelmapNativeUnaccessPixels001
* @tc.desc       : test PIXELMAPNATIVEUNACCESSPIXELS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeUnaccessPixels001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeUnaccessPixels()
      console.error("====>PixelmapNativeUnaccessPixels001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_IMAGEPROCESSINGCREATESUCCESS_0100
* @tc.name       : PixelmapNativeUnaccessPixels001
* @tc.desc       : test IMAGEPROCESSINGCREATESUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ImageProcessingCreateSuccess', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageProcessingCreateSuccess()
      console.error("====>PixelmapNativeUnaccessPixels001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_IMAGEPROCESSINGDESTROYSUCCESS_0100
* @tc.name       : ImageProcessingDestroySuccess001
* @tc.desc       : test IMAGEPROCESSINGDESTROYSUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ImageProcessingDestroySuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageProcessingDestroySuccess()
      console.error("====>ImageProcessingDestroySuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_IMAGEPROCESSINGDESTROY_0100
* @tc.name       : ImageProcessingDestroy001
* @tc.desc       : test IMAGEPROCESSINGDESTROY
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ImageProcessingDestroy001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageProcessingDestroy()
      console.error("====>ImageProcessingDestroy001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_IMAGEPROCESSINGSETPARAMETERSUCCESS_0100
* @tc.name       : ImageProcessingSetParameterSuccess001
* @tc.desc       : test IMAGEPROCESSINGSETPARAMETERSUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ImageProcessingSetParameterSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageProcessingSetParameterSuccess()
      console.error("====>ImageProcessingSetParameterSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_IMAGEPROCESSINGSETPARAMETER_0100
* @tc.name       : ImageProcessingSetParameter001
* @tc.desc       : test IMAGEPROCESSINGSETPARAMETER
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ImageProcessingSetParameter001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageProcessingSetParameter()
      console.error("====>ImageProcessingSetParameter001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_IMAGEPROCESSINGGETPARAMETERSUCCESS_0100
* @tc.name       : ImageProcessingGetParameterSuccess001
* @tc.desc       : test IMAGEPROCESSINGGETPARAMETERSUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ImageProcessingGetParameterSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageProcessingGetParameterSuccess()
      console.error("====>ImageProcessingGetParameterSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_IMAGEPROCESSINGGETPARAMETER_0100
* @tc.name       : ImageProcessingGetParameter001
* @tc.desc       : test IMAGEPROCESSINGGETPARAMETER
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ImageProcessingGetParameter001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageProcessingGetParameter()
      console.error("====>ImageProcessingGetParameter001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_IMAGEPROCESSINGCONVERTCOLORSPACEVALUE_0100
* @tc.name       : ImageProcessingConvertColorSpaceValue001
* @tc.desc       : test IMAGEPROCESSINGCONVERTCOLORSPACEVALUE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ImageProcessingConvertColorSpaceValue001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageProcessingConvertColorSpaceValue()
      console.error("====>ImageProcessingConvertColorSpaceValue001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_IMAGEPROCESSINGCONVERTCOLORSPACE_0100
* @tc.name       : ImageProcessingConvertColorSpace001
* @tc.desc       : test IMAGEPROCESSINGCONVERTCOLORSPACE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ImageProcessingConvertColorSpace001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageProcessingConvertColorSpace()
      console.error("====>ImageProcessingConvertColorSpace001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    28
    /*
* @tc.number     : SUB_IMAGEPROCESSINGCOMPOSEVALUE_0100
* @tc.name       : ImageProcessingComposeValue001
* @tc.desc       : test IMAGEPROCESSINGCOMPOSEVALUE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ImageProcessingComposeValue001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageProcessingComposeValue()
      console.error("====>ImageProcessingComposeValue001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_IMAGEPROCESSINGCOMPOSE_0100
* @tc.name       : ImageProcessingCompose001
* @tc.desc       : test IMAGEPROCESSINGCOMPOSE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ImageProcessingCompose001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageProcessingCompose()
      console.error("====>ImageProcessingCompose001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    6
    /*
* @tc.number     : SUB_IMAGEPROCESSINGDECOMPOSEVALUE_0100
* @tc.name       : ImageProcessingDecomposeValue001
* @tc.desc       : test IMAGEPROCESSINGDECOMPOSEVALUE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ImageProcessingDecomposeValue001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageProcessingDecomposeValue()
      console.error("====>ImageProcessingDecomposeValue001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_IMAGEPROCESSINGDECOMPOSE_0100
* @tc.name       : ImageProcessingDecompose001
* @tc.desc       : test IMAGEPROCESSINGDECOMPOSE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ImageProcessingDecompose001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageProcessingDecompose()
      console.error("====>ImageProcessingDecompose001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_IMAGEPROCESSINGGENERATEMETADATAVALUE_0100
* @tc.name       : ImageProcessingGenerateMetadataValue001
* @tc.desc       : test IMAGEPROCESSINGGENERATEMETADATAVALUE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ImageProcessingGenerateMetadataValue001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageProcessingGenerateMetadataValue()
      console.error("====>ImageProcessingGenerateMetadataValue001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_IMAGEPROCESSINGGENERATEMETADATA_0100
* @tc.name       : ImageProcessingGenerateMetadata001
* @tc.desc       : test IMAGEPROCESSINGGENERATEMETADATA
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ImageProcessingGenerateMetadata001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageProcessingGenerateMetadata()
      console.error("====>ImageProcessingGenerateMetadata001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_IMAGEPROCESSINGENHANCEDETAILVALUE_0100
* @tc.name       : ImageProcessingEnhanceDetailValue001
* @tc.desc       : test IMAGEPROCESSINGENHANCEDETAILVALUE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ImageProcessingEnhanceDetailValue001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageProcessingEnhanceDetailValue()
      console.error("====>ImageProcessingEnhanceDetailValue001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_IMAGEPROCESSINGENHANCEDETAIL_0100
* @tc.name       : ImageProcessingEnhanceDetail001
* @tc.desc       : test IMAGEPROCESSINGENHANCEDETAIL
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ImageProcessingEnhanceDetail001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageProcessingEnhanceDetail()
      console.error("====>ImageProcessingEnhanceDetail001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_IMAGEPROCESSINGCREATEINSTANCE_0100
* @tc.name       : ImageProcessingCreateInstance001
* @tc.desc       : test IMAGEPROCESSINGCREATEINSTANCE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ImageProcessingCreateInstance001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageProcessingCreateInstance()
      console.error("====>ImageProcessingCreateInstance001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_IMAGEPROCESSINGDEINITIALIZEENVIROMENT_0100
* @tc.name       : ImageProcessingDeinitializeEnvironment001
* @tc.desc       : test IMAGEPROCESSINGDEINITIALIZEENVIROMENT
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ImageProcessingDeinitializeEnvironment001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageProcessingDeinitializeEnvironment()
      console.error("====>ImageProcessingDeinitializeEnvironment001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPSCALEWITHANTIALIASINGNONE_0100
* @tc.name       : PixelMapScaleWithAntiAliasingNone001
* @tc.desc       : test PIXELMAPSCALEWITHANTIALIASINGNONE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelMapScaleWithAntiAliasingNone001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelMapScaleWithAntiAliasingNone()
      console.error("====>PixelMapScaleWithAntiAliasingNone001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPSCALEWITHANTIALIASINGLow_0100
* @tc.name       : PixelMapScaleWithAntiAliasingLow001
* @tc.desc       : test PIXELMAPSCALEWITHANTIALIASINGLow
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelMapScaleWithAntiAliasingLow001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelMapScaleWithAntiAliasingLow()
      console.error("====>PixelMapScaleWithAntiAliasingLow001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPSCALEWITHANTIALIASINGMedium_0100
* @tc.name       : PixelMapScaleWithAntiAliasingMedium001
* @tc.desc       : test PIXELMAPSCALEWITHANTIALIASINGMedium
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelMapScaleWithAntiAliasingMedium001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelMapScaleWithAntiAliasingMedium()
      console.error("====>PixelMapScaleWithAntiAliasingMedium001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
  })
}
