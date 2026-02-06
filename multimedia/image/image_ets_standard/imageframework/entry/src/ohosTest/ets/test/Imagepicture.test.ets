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
  describe('Imagepicture', () => {
    /*
* @tc.number     : SUB_PICTURENATIVECREATEPICTURE_0100
* @tc.name       : PictureNativeCreatePicture001
* @tc.desc       : test PICTURENATIVECREATEPICTURE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PictureNativeCreatePicture001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PictureNativeCreatePicture()
      console.error("====>PictureNativeCreatePicture err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PICTURENATIVEGETMAINPIXELMAP_0100
* @tc.name       : PictureNativeGetMainPixelmap001
* @tc.desc       : test PICTURENATIVEGETMAINPIXELMAP
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PictureNativeGetMainPixelmap001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PictureNativeGetMainPixelmap()
      console.error("====>PictureNativeCreatePictureSuccess err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PICTURENATIVEGETHDRCOMPOSEDPIXELMAP_0100
* @tc.name       : PictureNativeGetHdrComposedPixelmap001
* @tc.desc       : test PICTURENATIVEGETHDRCOMPOSEDPIXELMAP
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PictureNativeGetHdrComposedPixelmap001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PictureNativeGetHdrComposedPixelmap()
      console.error("====>PictureNativeGetHdrComposedPixelmap001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PICTURENATIVEGETGAINMAPPIXELMAP_0100
* @tc.name       : PictureNativeGetGainmapPixelmap001
* @tc.desc       : test PICTURENATIVEGETGAINMAPPIXELMAP
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PictureNativeGetGainmapPixelmap001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PictureNativeGetGainmapPixelmap()
      console.error("====>PictureNativeGetGainmapPixelmap001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PICTURENATIVESETAUXILIARYPICTURE_0100
* @tc.name       : PictureNativeSetAuxiliaryPicture001
* @tc.desc       : test PICTURENATIVESETAUXILIARYPICTURE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PictureNativeSetAuxiliaryPicture001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PictureNativeSetAuxiliaryPicture()
      console.error("====>PictureNativeSetAuxiliaryPicture001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PICTURENATIVEGETMETADATA_0100
* @tc.name       : PictureNativeGetMetadata001
* @tc.desc       : test PICTURENATIVEGETMETADATA
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PictureNativeGetMetadata001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PictureNativeGetMetadata()
      console.error("====>PictureNativeGetMetadata001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PICTURENATIVESETMETADATA_0100
* @tc.name       : PictureNativeSetMetadata001
* @tc.desc       : test PICTURENATIVESETMETADATA
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PictureNativeSetMetadata001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PictureNativeSetMetadata()
      console.error("====>PictureNativeSetMetadata001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PICTURENATIVE_RELEASE_0100
* @tc.name       : PictureNativeRelease001
* @tc.desc       : test PICTURENATIVE_RELEASE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PictureNativeRelease001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PictureNativeRelease()
      console.error("====>PictureNativeRelease001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_AUXILIARYPICTURENATIVECREATE_0100
* @tc.name       : AuxiliaryPictureNativeCreate001
* @tc.desc       : test AUXILIARYPICTURENATIVECREATE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('AuxiliaryPictureNativeCreate001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.AuxiliaryPictureNativeCreate()
      console.error("====>AuxiliaryPictureNativeCreate001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_AUXILIARYPICTURENATIVEWRITEPIXELS_0100
* @tc.name       : AuxiliaryPictureNativeWritePixels001
* @tc.desc       : test AUXILIARYPICTURENATIVEWRITEPIXELS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('AuxiliaryPictureNativeWritePixels001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.AuxiliaryPictureNativeWritePixels()
      console.error("====>AuxiliaryPictureNativeWritePixels001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_AUXILIARYPICTURENATIVEREADPIXELS_0100
* @tc.name       : AuxiliaryPictureNativeReadPixels001
* @tc.desc       : test AUXILIARYPICTURENATIVEREADPIXELS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('AuxiliaryPictureNativeReadPixels001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.AuxiliaryPictureNativeReadPixels()
      console.error("====>AuxiliaryPictureNativeReadPixels001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_AUXILIARYPICTURENATIVEGETTYPE_0100
* @tc.name       : AuxiliaryPictureNativeGetType001
* @tc.desc       : test AUXILIARYPICTURENATIVEGETTYPE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('AuxiliaryPictureNativeGetType001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.AuxiliaryPictureNativeGetType()
      console.error("====>AuxiliaryPictureNativeGetType001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_AUXILIARYPICTURENATIVEGETINFO_0100
* @tc.name       : AuxiliaryPictureNativeGetInfo001
* @tc.desc       : test AUXILIARYPICTURENATIVEGETINFO
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('AuxiliaryPictureNativeGetInfo001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.AuxiliaryPictureNativeGetInfo()
      console.error("====>AuxiliaryPictureNativeGetInfo001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_AUXILIARYPICTURENATIVESETINFO_0100
* @tc.name       : AuxiliaryPictureNativeSetInfo001
* @tc.desc       : test AUXILIARYPICTURENATIVESETINFO
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('AuxiliaryPictureNativeSetInfo001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.AuxiliaryPictureNativeSetInfo()
      console.error("====>AuxiliaryPictureNativeSetInfo001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_AUXILIARYPICTURENATIVEGETMETADATA_0100
* @tc.name       : AuxiliaryPictureNativeGetMetadata001
* @tc.desc       : test AUXILIARYPICTURENATIVEGETMETADATA
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('AuxiliaryPictureNativeGetMetadata001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.AuxiliaryPictureNativeGetMetadata()
      console.error("====>AuxiliaryPictureNativeGetMetadata001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_AUXILIARYPICTURENATIVESETMETADATA_0100
* @tc.name       : AuxiliaryPictureNativeSetMetadata001
* @tc.desc       : test AUXILIARYPICTURENATIVESETMETADATA
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('AuxiliaryPictureNativeSetMetadata001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.AuxiliaryPictureNativeSetMetadata()
      console.error("====>AuxiliaryPictureNativeSetMetadata001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_AUXILIARYPICTURENATIVERELEASE_0100
* @tc.name       : AuxiliaryPictureNativeRelease001
* @tc.desc       : test AUXILIARYPICTURENATIVERELEASE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('AuxiliaryPictureNativeRelease001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.AuxiliaryPictureNativeRelease()
      console.error("====>AuxiliaryPictureNativeRelease001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_AUXILIARYPICTUREINFOCREATE_0100
* @tc.name       : AuxiliaryPictureInfoCreate001
* @tc.desc       : test AUXILIARYPICTUREINFOCREATE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('AuxiliaryPictureInfoCreate001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.AuxiliaryPictureInfoCreate()
      console.error("====>AuxiliaryPictureInfoCreate001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_AUXILIARYPICTUREINFOGETTYPE_0100
* @tc.name       : AuxiliaryPictureInfoGetType001
* @tc.desc       : test AUXILIARYPICTUREINFOGETTYPE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('AuxiliaryPictureInfoGetType001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.AuxiliaryPictureInfoGetType()
      console.error("====>AuxiliaryPictureInfoGetType001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_AUXILIARYPICTUREINFOSETTYPE_0100
* @tc.name       : AuxiliaryPictureInfoSetType001
* @tc.desc       : test AUXILIARYPICTUREINFOSETTYPE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('AuxiliaryPictureInfoSetType001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.AuxiliaryPictureInfoSetType()
      console.error("====>AuxiliaryPictureInfoSetType001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_AUXILIARYPICTUREINFOGETSIZE_0100
* @tc.name       : AuxiliaryPictureInfoGetSize001
* @tc.desc       : test AUXILIARYPICTUREINFOGETSIZE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('AuxiliaryPictureInfoGetSize001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.AuxiliaryPictureInfoGetSize()
      console.error("====>AuxiliaryPictureInfoGetSize001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_AUXILIARYPICTUREINFOSETSIZE_0100
* @tc.name       : AuxiliaryPictureInfoSetSize001
* @tc.desc       : test AUXILIARYPICTUREINFOSETSIZE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('AuxiliaryPictureInfoSetSize001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.AuxiliaryPictureInfoSetSize()
      console.error("====>AuxiliaryPictureInfoSetSize001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_AUXILIARYPICTUREINFOGETROWSTRIDE_0100
* @tc.name       : AuxiliaryPictureInfoGetRowStride001
* @tc.desc       : test AUXILIARYPICTUREINFOGETROWSTRIDE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('AuxiliaryPictureInfoGetRowStride001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.AuxiliaryPictureInfoGetRowStride()
      console.error("====>AuxiliaryPictureInfoGetRowStride001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_AUXILIARYPICTUREINFOSETROWSTRIDE_0100
* @tc.name       : AuxiliaryPictureInfoSetRowStride001
* @tc.desc       : test AUXILIARYPICTUREINFOSETROWSTRIDE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('AuxiliaryPictureInfoSetRowStride001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.AuxiliaryPictureInfoSetRowStride()
      console.error("====>AuxiliaryPictureInfoSetRowStride001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_AUXILIARYPICTUREINFOGETPIXELFORMAT_0100
* @tc.name       : AuxiliaryPictureInfoGetPixelFormat001
* @tc.desc       : test AUXILIARYPICTUREINFOGETPIXELFORMAT
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('AuxiliaryPictureInfoGetPixelFormat001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.AuxiliaryPictureInfoGetPixelFormat()
      console.error("====>AuxiliaryPictureInfoGetPixelFormat001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_AUXILIARYPICTUREINFOSETPIXELFORMAT_0100
* @tc.name       : AuxiliaryPictureInfoSetPixelFormat001
* @tc.desc       : test AUXILIARYPICTUREINFOSETPIXELFORMAT
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('AuxiliaryPictureInfoSetPixelFormat001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.AuxiliaryPictureInfoSetPixelFormat()
      console.error("====>AuxiliaryPictureInfoSetPixelFormat001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_AUXILIARYPICTUREINFORELEASE_0100
* @tc.name       : AuxiliaryPictureInfoRelease001
* @tc.desc       : test AUXILIARYPICTUREINFORELEASE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('AuxiliaryPictureInfoRelease001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.AuxiliaryPictureInfoRelease()
      console.error("====>AuxiliaryPictureInfoRelease001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_AUXILIARYPICTURENATIVE_CREATESUCCESS_0100
* @tc.name       : AuxiliaryPictureNativeCreateSuccess001
* @tc.desc       : test AUXILIARYPICTURENATIVE_CREATESUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('AuxiliaryPictureNativeCreateSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.AuxiliaryPictureNativeCreateSuccess()
      console.error("====>AuxiliaryPictureNativeCreateSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_AUXILIARYPICTUREINFOCREATESUCCESS_0100
* @tc.name       : AuxiliaryPictureInfoCreateSuccess001
* @tc.desc       : test AUXILIARYPICTUREINFOCREATESUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('AuxiliaryPictureInfoCreateSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.AuxiliaryPictureInfoCreateSuccess()
      console.error("====>AuxiliaryPictureNativeCreateSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_AUXILIARYPICTUREINFOSETTYPESUCCESS_0100
* @tc.name       : AuxiliaryPictureInfoSetTypeSuccess001
* @tc.desc       : test AUXILIARYPICTUREINFOSETTYPESUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('AuxiliaryPictureInfoSetTypeSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.AuxiliaryPictureInfoSetTypeSuccess()
      console.error("====>AuxiliaryPictureInfoSetTypeSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_AUXILIARYPICTUREINFOGETSIZESUCCES_0100
* @tc.name       : AuxiliaryPictureInfoGetSizeSucces001
* @tc.desc       : test AUXILIARYPICTUREINFOGETSIZESUCCES
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('AuxiliaryPictureInfoGetSizeSucces001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.AuxiliaryPictureInfoGetSizeSucces()
      console.error("====>AuxiliaryPictureInfoGetSizeSucces001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_AUXILIARYPICTUREINFOSETSIZESUCCESS_0100
* @tc.name       : AuxiliaryPictureInfoSetSizeSuccess001
* @tc.desc       : test AUXILIARYPICTUREINFOSETSIZESUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('AuxiliaryPictureInfoSetSizeSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.AuxiliaryPictureInfoSetSizeSuccess()
      console.error("====>AuxiliaryPictureInfoSetSizeSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_AUXILIARYPICTUREINFOGETROWSTRIDESUCCESS_0100
* @tc.name       : AuxiliaryPictureInfoGetRowStrideSuccess001
* @tc.desc       : test AUXILIARYPICTUREINFOGETROWSTRIDESUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('AuxiliaryPictureInfoGetRowStrideSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.AuxiliaryPictureInfoGetRowStrideSuccess()
      console.error("====>AuxiliaryPictureInfoGetRowStrideSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_AUXILIARYPICTUREINFOSETROWSTRIDESUCCESS_0100
* @tc.name       : AuxiliaryPictureInfoSetRowStrideSuccess001
* @tc.desc       : test AUXILIARYPICTUREINFOSETROWSTRIDESUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('AuxiliaryPictureInfoSetRowStrideSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.AuxiliaryPictureInfoSetRowStrideSuccess()
      console.error("====>AuxiliaryPictureInfoSetRowStrideSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_AUXILIARYPICTUREINFOGETPIXELFORMATSUCCESS_0100
* @tc.name       : AuxiliaryPictureInfoGetPixelFormatSuccess001
* @tc.desc       : test AUXILIARYPICTUREINFOGETPIXELFORMATSUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('AuxiliaryPictureInfoGetPixelFormatSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.AuxiliaryPictureInfoGetPixelFormatSuccess()
      console.error("====>AuxiliaryPictureInfoGetPixelFormatSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_AUXILIARYPICTUREINFOSETPIXELFORMATSUCCESS_0100
* @tc.name       : AuxiliaryPictureInfoSetPixelFormatSuccess001
* @tc.desc       : test AUXILIARYPICTUREINFOSETPIXELFORMATSUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('AuxiliaryPictureInfoSetPixelFormatSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.AuxiliaryPictureInfoSetPixelFormatSuccess()
      console.error("====>AuxiliaryPictureInfoSetPixelFormatSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_AUXILIARYPICTUREINFORELEASESUCCESS_0100
* @tc.name       : AuxiliaryPictureInfoReleaseSuccess001
* @tc.desc       : test AUXILIARYPICTUREINFORELEASESUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('AuxiliaryPictureInfoReleaseSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.AuxiliaryPictureInfoReleaseSuccess()
      console.error("====>AuxiliaryPictureInfoReleaseSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_AUXILIARYPICTUREINFOGETTYPESUCCESS_0100
* @tc.name       : AuxiliaryPictureInfoGetTypeSucess001
* @tc.desc       : test AUXILIARYPICTUREINFOGETTYPESUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('AuxiliaryPictureInfoGetTypeSucess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.AuxiliaryPictureInfoGetTypeSucess()
      console.error("====>AuxiliaryPictureInfoGetTypeSucess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPINITIALIZATIONOPTIONSCREATE_0100
* @tc.name       : PixelmapInitializationOptionsCreate001
* @tc.desc       : test PIXELMAPINITIALIZATIONOPTIONSCREATE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapInitializationOptionsCreate001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapInitializationOptionsCreate()
      console.error("====>PixelmapInitializationOptionsCreate001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPINITIALIZATIONOPTIONSCREATESUCCESS_0100
* @tc.name       : PixelmapInitializationOptionsCreate001
* @tc.desc       : test PIXELMAPINITIALIZATIONOPTIONSCREATESUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapInitializationOptionsCreateSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapInitializationOptionsCreateSuccess()
      console.error("====>PixelmapInitializationOptionsCreateSuccess err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPINITIALIZATIONOPTIONSGETWIDTHSUCCESS_0100
* @tc.name       : PixelmapInitializationOptionsGetWidthSuccess001
* @tc.desc       : test PIXELMAPINITIALIZATIONOPTIONSGETWIDTHSUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapInitializationOptionsGetWidthSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapInitializationOptionsGetWidthSuccess()
      console.error("====>PixelmapInitializationOptionsCreateSuccess err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPINITIALIZATIONOPTIONSGETWIDTH_0100
* @tc.name       : PixelmapInitializationOptionsGetWidth001
* @tc.desc       : test PIXELMAPINITIALIZATIONOPTIONSGETWIDTH
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapInitializationOptionsGetWidth001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapInitializationOptionsGetWidth()
      console.error("====>PixelmapInitializationOptionsCreateSuccess err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPINITIALIZATIONOPTIONSSetWIDTH_0100
* @tc.name       : PixelmapInitializationOptionsSetWidth001
* @tc.desc       : test PIXELMAPINITIALIZATIONOPTIONSSetWIDTH
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapInitializationOptionsSetWidth001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapInitializationOptionsSetWidth()
      console.error("====>PixelmapInitializationOptionsSetWidth001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPINITIALIZATIONOPTIONSGETHEIGHT_0100
* @tc.name       : PixelmapInitializationOptionsGetHeight001
* @tc.desc       : test PIXELMAPINITIALIZATIONOPTIONSGETHEIGHT
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapInitializationOptionsGetHeight001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapInitializationOptionsGetHeight()
      console.error("====>PixelmapInitializationOptionsGetHeight001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPINITIALIZATIONOPTIONSSetHEIGHT_0100
* @tc.name       : PixelmapInitializationOptionsSetHeight001
* @tc.desc       : test PIXELMAPINITIALIZATIONOPTIONSSetHEIGHT
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapInitializationOptionsSetHeight001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapInitializationOptionsSetHeight()
      console.error("====>PixelmapInitializationOptionsSetHeight001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPINITIALIZATIONOPTIONSSetWIDTHSUCCESS_0100
* @tc.name       : PixelmapInitializationOptionsSetWidthSuccess001
* @tc.desc       : test PIXELMAPINITIALIZATIONOPTIONSSetWIDTHSUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapInitializationOptionsSetWidthSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapInitializationOptionsSetWidthSuccess()
      console.error("====>PixelmapInitializationOptionsSetWidthSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPINITIALIZATIONOPTIONSGETHEIGHTSUCCESS_0100
* @tc.name       : PixelmapInitializationOptionsGetHeightSuccess001
* @tc.desc       : test PIXELMAPINITIALIZATIONOPTIONSGETHEIGHTSUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapInitializationOptionsGetHeightSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapInitializationOptionsGetHeightSuccess()
      console.error("====>PixelmapInitializationOptionsGetHeightSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPINITIALIZATIONOPTIONSSETHEIGHTSUCCESS_0100
* @tc.name       : PixelmapInitializationOptionsSetHeightSuccess001
* @tc.desc       : test PIXELMAPINITIALIZATIONOPTIONSSETHEIGHTSUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapInitializationOptionsSetHeightSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapInitializationOptionsSetHeightSuccess()
      console.error("====>PixelmapInitializationOptionsSetHeightSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPINITIALIZATIONOPTIONSGETPIXELFORMAT_0100
* @tc.name       : PixelmapInitializationOptionsGetPixelFormat001
* @tc.desc       : test PIXELMAPINITIALIZATIONOPTIONSGETPIXELFORMAT
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapInitializationOptionsGetPixelFormat001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapInitializationOptionsGetPixelFormat()
      console.error("====>PixelmapInitializationOptionsGetPixelFormat001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPINITIALIZATIONOPTIONSSETPIXELFORMAT_0100
* @tc.name       : PixelmapInitializationOptionsSetPixelFormat001
* @tc.desc       : test PIXELMAPINITIALIZATIONOPTIONSSETPIXELFORMAT
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapInitializationOptionsSetPixelFormat001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapInitializationOptionsSetPixelFormat()
      console.error("====>PixelmapInitializationOptionsSetPixelFormat001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPINITIALIZATIONOPTIONSGETSRCPIXELFORMAT_0100
* @tc.name       : PixelmapInitializationOptionsGetSrcPixelFormat001
* @tc.desc       : test PIXELMAPINITIALIZATIONOPTIONSGETSRCPIXELFORMAT
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapInitializationOptionsGetSrcPixelFormat001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapInitializationOptionsGetSrcPixelFormat()
      console.error("====>PixelmapInitializationOptionsGetSrcPixelFormat001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPINITIALIZATIONOPTIONSSETSRCPIXELFORMAT_0100
* @tc.name       : PixelmapInitializationOptionsSetSrcPixelFormat001
* @tc.desc       : test PIXELMAPINITIALIZATIONOPTIONSSETSRCPIXELFORMAT
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapInitializationOptionsSetSrcPixelFormat001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapInitializationOptionsSetSrcPixelFormat()
      console.error("====>PixelmapInitializationOptionsSetSrcPixelFormat001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPINITIALIZATIONOPTIONSGETPIXELFORMATSUCCESS_0100
* @tc.name       : PixelmapInitializationOptionsGetPixelFormatSuccess001
* @tc.desc       : test PIXELMAPINITIALIZATIONOPTIONSGETPIXELFORMATSUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapInitializationOptionsGetPixelFormatSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapInitializationOptionsGetPixelFormatSuccess()
      console.error("====>PixelmapInitializationOptionsGetPixelFormatSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPINITIALIZATIONOPTIONSSETPIXELFORMATSUCCESS_0100
* @tc.name       : PixelmapInitializationOptionsSetPixelFormatSuccess001
* @tc.desc       : test PIXELMAPINITIALIZATIONOPTIONSSETPIXELFORMATSUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapInitializationOptionsSetPixelFormatSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapInitializationOptionsSetPixelFormatSuccess()
      console.error("====>PixelmapInitializationOptionsSetPixelFormatSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPINITIALIZATIONOPTIONSGETSRCPIXELFORMATSUCCESS_0100
* @tc.name       : PixelmapInitializationOptionsGetSrcPixelFormatSuccess001
* @tc.desc       : test PIXELMAPINITIALIZATIONOPTIONSGETSRCPIXELFORMATSUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapInitializationOptionsGetSrcPixelFormatSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapInitializationOptionsGetSrcPixelFormatSuccess()
      console.error("====>PixelmapInitializationOptionsGetSrcPixelFormatSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPINITIALIZATIONOPTIONSSETSRCPIXELFORMATSUCCESS_0100
* @tc.name       : PixelmapInitializationOptionsSetSrcPixelFormatSuccess001
* @tc.desc       : test PIXELMAPINITIALIZATIONOPTIONSSETSRCPIXELFORMATSUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapInitializationOptionsSetSrcPixelFormatSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapInitializationOptionsSetSrcPixelFormatSuccess()
      console.error("====>PixelmapInitializationOptionsSetSrcPixelFormatSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPINITIALIZATIONOPTIONSGETROWSTRIDESUCCESS_0100
* @tc.name       : PixelmapInitializationOptionsGetRowStrideSuccess001
* @tc.desc       : test PIXELMAPINITIALIZATIONOPTIONSGETROWSTRIDESUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapInitializationOptionsGetRowStrideSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapInitializationOptionsGetRowStrideSuccess()
      console.error("====>PixelmapInitializationOptionsGetRowStrideSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPINITIALIZATIONOPTIONSGETROWSTRIDE_0100
* @tc.name       : PixelmapInitializationOptionsGetRowStride001
* @tc.desc       : test PIXELMAPINITIALIZATIONOPTIONSGETROWSTRIDE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapInitializationOptionsGetRowStride001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapInitializationOptionsGetRowStride()
      console.error("====>PixelmapInitializationOptionsGetRowStride001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPINITIALIZATIONOPTIONSSETROWSTRIDE_0100
* @tc.name       : PixelmapInitializationOptionsSetRowStride001
* @tc.desc       : test PIXELMAPINITIALIZATIONOPTIONSSETROWSTRIDE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapInitializationOptionsSetRowStride001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapInitializationOptionsSetRowStride()
      console.error("====>PixelmapInitializationOptionsSetRowStride001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPINITIALIZATIONOPTIONSGETALPHATYPE_0100
* @tc.name       : PixelmapInitializationOptionsGetAlphaType001
* @tc.desc       : test PIXELMAPINITIALIZATIONOPTIONSGETALPHATYPE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapInitializationOptionsGetAlphaType001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapInitializationOptionsGetAlphaType()
      console.error("====>PixelmapInitializationOptionsGetAlphaType001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPINITIALIZATIONOPTIONSSETALPHATYPE_0100
* @tc.name       : PixelmapInitializationOptionsSetAlphaType001
* @tc.desc       : test PIXELMAPINITIALIZATIONOPTIONSSETALPHATYPE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapInitializationOptionsSetAlphaType001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapInitializationOptionsSetAlphaType()
      console.error("====>PixelmapInitializationOptionsSetAlphaType001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPINITIALIZATIONOPTIONSGETEDITABLE_0100
* @tc.name       : PixelmapInitializationOptionsGetEditable001
* @tc.desc       : test PIXELMAPINITIALIZATIONOPTIONSGETEDITABLE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapInitializationOptionsGetEditable001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapInitializationOptionsGetEditable()
      console.error("====>PixelmapInitializationOptionsGetEditable001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPINITIALIZATIONOPTIONSSETEDITABLE_0100
* @tc.name       : PixelmapInitializationOptionsSetEditable001
* @tc.desc       : test PIXELMAPINITIALIZATIONOPTIONSSETEDITABLE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapInitializationOptionsSetEditable001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapInitializationOptionsSetEditable()
      console.error("====>PixelmapInitializationOptionsSetEditable001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPINITIALIZATIONOPTIONSRELEASE_0100
* @tc.name       : PixelmapInitializationOptionsRelease001
* @tc.desc       : test PIXELMAPINITIALIZATIONOPTIONSRELEASE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapInitializationOptionsRelease001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapInitializationOptionsRelease()
      console.error("====>PixelmapInitializationOptionsRelease001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPIMAGEINFOCREATE_0100
* @tc.name       : PixelmapImageInfoCreate001
* @tc.desc       : test PIXELMAPIMAGEINFOCREATE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapImageInfoCreate001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapImageInfoCreate()
      console.error("====>PixelmapImageInfoCreate001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPIMAGEINFOCREATEGETWIDTH_0100
* @tc.name       : PixelmapImageInfoGetWidth001
* @tc.desc       : test PIXELMAPIMAGEINFOCREATEGETWIDTH
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapImageInfoGetWidth001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapImageInfoGetWidth()
      console.error("====>PixelmapImageInfoGetWidth001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPIMAGEINFOGETHEIGHT_0100
* @tc.name       : PixelmapImageInfoGetHeight001
* @tc.desc       : test PIXELMAPIMAGEINFOGETHEIGHT
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapImageInfoGetHeight001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapImageInfoGetHeight()
      console.error("====>PixelmapImageInfoGetHeight001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPINITIALIZATIONOPTIONSSETROWSTRIDESUCCESS_0100
* @tc.name       : PixelmapInitializationOptionsSetRowStrideSuccess001
* @tc.desc       : test PIXELMAPINITIALIZATIONOPTIONSSETROWSTRIDESUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapInitializationOptionsSetRowStrideSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapInitializationOptionsSetRowStrideSuccess()
      console.error("====>PixelmapInitializationOptionsSetRowStrideSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPINITIALIZATIONOPTIONSGETROWSTRIDESUCCESSSUCCESS_0100
* @tc.name       : PixelmapInitializationOptionsGetAlphaTypeSuccess001
* @tc.desc       : test PIXELMAPINITIALIZATIONOPTIONSGETROWSTRIDESUCCESSSUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapInitializationOptionsGetAlphaTypeSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapInitializationOptionsGetAlphaTypeSuccess()
      console.error("====>PixelmapInitializationOptionsGetAlphaTypeSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPINITIALIZATIONOPTIONSSETALPHATYPESUCCESS_0100
* @tc.name       : PixelmapInitializationOptionsSetAlphaTypeSuccess001
* @tc.desc       : test PIXELMAPINITIALIZATIONOPTIONSSETALPHATYPESUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapInitializationOptionsSetAlphaTypeSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapInitializationOptionsSetAlphaTypeSuccess()
      console.error("====>PixelmapInitializationOptionsSetAlphaTypeSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPINITIALIZATIONOPTIONSGETEDITABLESUCCESS_0100
* @tc.name       : PixelmapInitializationOptionsGetEditableSuccess001
* @tc.desc       : test PIXELMAPINITIALIZATIONOPTIONSGETEDITABLESUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapInitializationOptionsGetEditableSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapInitializationOptionsGetEditableSuccess()
      console.error("====>PixelmapInitializationOptionsGetEditableSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPINITIALIZATIONOPTIONSSETEDITABLESUCCESS_0100
* @tc.name       : PixelmapInitializationOptionsSetEditableSuccess001
* @tc.desc       : test SUB_PIXELMAPINITIALIZATIONOPTIONSSETEDITABLESUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapInitializationOptionsSetEditableSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapInitializationOptionsSetEditableSuccess()
      console.error("====>PixelmapInitializationOptionsSetEditableSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_SUB_PIXELMAPINITIALIZATIONOPTIONSRELEASESUCCESS_0100
* @tc.name       : PixelmapInitializationOptionsReleaseSuccess001
* @tc.desc       : test SUB_PIXELMAPINITIALIZATIONOPTIONSRELEASESUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapInitializationOptionsReleaseSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapInitializationOptionsReleaseSuccess()
      console.error("====>PixelmapInitializationOptionsReleaseSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPIMAGEINFOCREATESUCCESS_0100
* @tc.name       : PixelmapImageInfoCreateSuccess001
* @tc.desc       : test PIXELMAPIMAGEINFOCREATESUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapImageInfoCreateSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapImageInfoCreateSuccess()
      console.error("====>PixelmapInitializationOptionsGetRowStride001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPIMAGEINFOGETWIDTHSUCCESS_0100
* @tc.name       : PixelmapImageInfoGetWidthSuccess001
* @tc.desc       : test PIXELMAPIMAGEINFOGETWIDTHSUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapImageInfoGetWidthSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapImageInfoGetWidthSuccess()
      console.error("====>PixelmapImageInfoGetWidthSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPIMAGEINFOGETHEIGHTSUCCESS_0100
* @tc.name       : PixelmapInitializationOptionsGetRowStride001
* @tc.desc       : test PIXELMAPIMAGEINFOGETHEIGHTSUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapImageInfoGetHeightSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapImageInfoGetHeightSuccess()
      console.error("====>PixelmapImageInfoGetHeightSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPIMAGEINFOGETALPHAMODESUCCESS_0100
* @tc.name       : PixelmapImageInfoGetAlphaModeSuccess001
* @tc.desc       : test PIXELMAPIMAGEINFOGETALPHAMODESUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapImageInfoGetAlphaModeSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapImageInfoGetAlphaModeSuccess()
      console.error("====>PixelmapImageInfoGetAlphaModeSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPIMAGEINFOGETALPHAMODE_0100
* @tc.name       : PixelmapImageInfoGetAlphaMode001
* @tc.desc       : test PIXELMAPIMAGEINFOGETALPHAMODE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapImageInfoGetAlphaMode001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapImageInfoGetAlphaMode()
      console.error("====>PixelmapImageInfoGetAlphaMode001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPIMAGEINFOGETROWSTRIDESUCCESS_0100
* @tc.name       : PixelmapImageInfoGetRowStrideSuccess001
* @tc.desc       : test PIXELMAPIMAGEINFOGETROWSTRIDESUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapImageInfoGetRowStrideSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapImageInfoGetRowStrideSuccess()
      console.error("====>PixelmapImageInfoGetRowStrideSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPIMAGEINFOGETROWSTRIDE_0100
* @tc.name       : PixelmapImageInfoGetRowStride001
* @tc.desc       : test PIXELMAPIMAGEINFOGETROWSTRIDE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapImageInfoGetRowStride001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapImageInfoGetRowStride()
      console.error("====>PixelmapImageInfoGetRowStride001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPIMAGEINFOGETPIXELFORMATSUCCESS_0100
* @tc.name       : PixelmapImageInfoGetPixelFormatSuccess001
* @tc.desc       : test PIXELMAPIMAGEINFOGETPIXELFORMATSUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapImageInfoGetPixelFormatSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapImageInfoGetPixelFormatSuccess()
      console.error("====>PixelmapImageInfoGetPixelFormatSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPIMAGEINFOGETPIXELFORMAT_0100
* @tc.name       : PixelmapImageInfoGetPixelFormat001
* @tc.desc       : test PIXELMAPIMAGEINFOGETPIXELFORMAT
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapImageInfoGetPixelFormat001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapImageInfoGetPixelFormat()
      console.error("====>PixelmapImageInfoGetPixelFormat001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPIMAGEINFOGETALPHATYPESUCCESS_0100
* @tc.name       : PixelmapImageInfoGetAlphaTypeSuccess001
* @tc.desc       : test PIXELMAPIMAGEINFOGETALPHATYPESUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapImageInfoGetAlphaTypeSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapImageInfoGetAlphaTypeSuccess()
      console.error("====>PixelmapImageInfoGetAlphaTypeSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPIMAGEINFOGETALPHATYPE_0100
* @tc.name       : PixelmapImageInfoGetAlphaType001
* @tc.desc       : test PIXELMAPIMAGEINFOGETALPHATYPE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapImageInfoGetAlphaType001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapImageInfoGetAlphaType()
      console.error("====>PixelmapImageInfoGetAlphaType001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPIMAGEINFOGETDYNAMICRANGESUCCESS_0100
* @tc.name       : PixelmapImageInfoGetDynamicRangeSuccess001
* @tc.desc       : test PIXELMAPIMAGEINFOGETDYNAMICRANGESUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapImageInfoGetDynamicRangeSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapImageInfoGetDynamicRangeSuccess()
      console.error("====>PixelmapImageInfoGetDynamicRangeSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPIMAGEINFOGETDYNAMICRANGE_0100
* @tc.name       : PixelmapImageInfoGetDynamicRange001
* @tc.desc       : test PIXELMAPIMAGEINFOGETDYNAMICRANGE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapImageInfoGetDynamicRange001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapImageInfoGetDynamicRange()
      console.error("====>PixelmapImageInfoGetDynamicRange001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPIMAGEINFORELEASESUCCESS_0100
* @tc.name       : PixelmapImageInfoReleaseSuccess001
* @tc.desc       : test PIXELMAPIMAGEINFORELEASESUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapImageInfoReleaseSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapImageInfoReleaseSuccess()
      console.error("====>PixelmapImageInfoReleaseSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPIMAGEINFORELEASE_0100
* @tc.name       : PixelmapImageInfoRelease001
* @tc.desc       : test PIXELMAPIMAGEINFORELEASE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapImageInfoRelease001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapImageInfoRelease()
      console.error("====>PixelmapImageInfoRelease001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVECREATEPIXELMAPSUCCESS_0100
* @tc.name       : PixelmapNativeCreatePixelmapSuccess001
* @tc.desc       : test PIXELMAPNATIVECREATEPIXELMAPSUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeCreatePixelmapSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeCreatePixelmapSuccess()
      console.error("====>PixelmapNativeCreatePixelmapSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVECREATEPIXELMAP_0100
* @tc.name       : PixelmapNativeCreatePixelmap001
* @tc.desc       : test PIXELMAPNATIVECREATEPIXELMAPSUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeCreatePixelmap001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeCreatePixelmap()
      console.error("====>PixelmapNativeCreatePixelmap001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    10
    /*
* @tc.number     : SUB_CREATEPIXELMAPUSINGALLOCATOR_0100
* @tc.name       : CreatePixelmapUsingAllocator001
* @tc.desc       : test CREATEPIXELMAPUSINGALLOCATOR
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('CreatePixelmapUsingAllocator001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.CreatePixelmapUsingAllocator()
      console.error("====>PixelmapNativeCreatePixelmap001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_CONVERTPIXELMAPNATIVETONAPI_0100
* @tc.name       : ConvertPixelmapNativeToNapi001
* @tc.desc       : test CONVERTPIXELMAPNATIVETONAPI
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ConvertPixelmapNativeToNapi001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ConvertPixelmapNativeToNapi()
      console.error("====>ConvertPixelmapNativeToNapi001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_CONVERTPIXELMAPNATIVETONAPISUCCESS_0100
* @tc.name       : ConvertPixelmapNativeToNapiSuccess001
* @tc.desc       : test CONVERTPIXELMAPNATIVETONAPISUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ConvertPixelmapNativeToNapiSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ConvertPixelmapNativeToNapiSuccess()
      console.error("====>ConvertPixelmapNativeToNapiSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    7
    /*
* @tc.number     : SUB_CONVERTPIXELMAPNATIVEFROMNAPI_0100
* @tc.name       : ConvertPixelmapNativeFromNapi001
* @tc.desc       : test CONVERTPIXELMAPNATIVEFROMNAPI
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ConvertPixelmapNativeFromNapi001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ConvertPixelmapNativeFromNapi()
      console.error("====>PixelmapNativeCreatePixelmap001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVEREADPIXELS_0100
* @tc.name       : PixelmapNativeReadPixels001
* @tc.desc       : test PIXELMAPNATIVEREADPIXELS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeReadPixels001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeReadPixels()
      console.error("====>PixelmapNativeReadPixels001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVEWRITEPIXELS_0100
* @tc.name       : PixelmapNativeWritePixels001
* @tc.desc       : test PIXELMAPNATIVEWRITEPIXELS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeWritePixels001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeWritePixels()
      console.error("====>PixelmapNativeWritePixels001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVEGETARGBPIXELSSUCCESS_0100
* @tc.name       : PixelmapNativeGetArgbPixelsSuccess001
* @tc.desc       : test PIXELMAPNATIVEGETARGBPIXELSSUCCESS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeGetArgbPixelsSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeGetArgbPixelsSuccess()
      console.error("====>PixelmapNativeGetArgbPixelsSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVEGETARGBPIXELS_0100
* @tc.name       : PixelmapNativeGetArgbPixels001
* @tc.desc       : test PIXELMAPNATIVEGETARGBPIXELS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeGetArgbPixels001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeGetArgbPixels()
      console.error("====>PixelmapNativeGetArgbPixels001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVETOSDR_0100
* @tc.name       : PixelmapNativeToSdr001
* @tc.desc       : test PIXELMAPNATIVETOSDR
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeToSdr001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeToSdr()
      console.error("====>PixelmapNativeToSdr001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_PIXELMAPNATIVEGETIMAGEINFO_0100
* @tc.name       : PixelmapNativeGetImageInfo001
* @tc.desc       : test PIXELMAPNATIVEGETIMAGEINFO
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('PixelmapNativeGetImageInfo001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.PixelmapNativeGetImageInfo()
      console.error("====>PixelmapNativeToSdr001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
  })
}

