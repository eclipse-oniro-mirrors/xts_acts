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
  describe('ImageKitTest', () => {
    /**
     * @tc.name   CreateImageReceiver001
     * @tc.number SUB_CREATEIMAGERECEIVER_0100
     * @tc.desc   test CREATEIMAGERECEIVER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CreateImageReceiver001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.CreateImageReceiver()
      console.error("====>CreateImageReceiver001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   GetReceivingSurfaceId001
     * @tc.number SUB_GETRECEIVINGSURFACEID_0100
     * @tc.desc   test GETRECEIVINGSURFACEID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetReceivingSurfaceId001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.GetReceivingSurfaceId()
      console.error("====>GetReceivingSurfaceId001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   ReadLatestImage001
     * @tc.number SUB_READLATESTIMAGE_0100
     * @tc.desc   test READLATESTIMAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ReadLatestImage001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ReadLatestImage()
      console.error("====>ReadLatestImage001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   ReadNextImage001
     * @tc.number SUB_READNEXTIMAGE_0100
     * @tc.desc   test READNEXTIMAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ReadNextImage001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ReadNextImage()
      console.error("====>ReadNextImage001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   ReceiverOn001
     * @tc.number SUB_RECEIVERON_0100
     * @tc.desc   test RECEIVERON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ReceiverOn001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ReceiverOn()
      console.error("====>ReceiverOn001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   ReceiverGetSize001
     * @tc.number SUB_RECEIVERGETSIZE_0100
     * @tc.desc   test RECEIVERGETSIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ReceiverGetSize001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ReceiverGetSize()
      console.error("====>ReceiverGetSize001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   ReceiverGetCapacity001
     * @tc.number SUB_RECEIVERGETCAPACITY_0100
     * @tc.desc   test RECEIVERGETCAPACITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ReceiverGetCapacity001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ReceiverGetCapacity()
      console.error("====>ReceiverGetCapacity001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   ReceiverGetFormat001
     * @tc.number SUB_RECEIVERGETFORMAT_0100
     * @tc.desc   test RECEIVERGETFORMAT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ReceiverGetFormat001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ReceiverGetFormat()
      console.error("====>ReceiverGetFormat001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   ReceiverRelease001
     * @tc.number SUB_RECEIVERRELEASE_0100
     * @tc.desc   test RECEIVERRELEASE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ReceiverRelease001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ReceiverRelease()
      console.error("====>ReceiverRelease001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   ImageSourceCreate001
     * @tc.number SUB_IMAGESOURCECREATE_0100
     * @tc.desc   test IMAGESOURCECREATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageSourceCreate001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageSourceCreate()
      console.error("====>ImageSourceCreate001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   ImageSourceCreateFromUri001
     * @tc.number SUB_IMAGESOURCECREATEFROMURI_0100
     * @tc.desc   test IMAGESOURCECREATEFROMURI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageSourceCreateFromUri001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageSourceCreateFromUri()
      console.error("====>ImageSourceCreateFromUri001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   ImageSourceCreateFromFd001
     * @tc.number SUB_IMAGESOURCECREATEFROMFD_0100
     * @tc.desc   test IMAGESOURCECREATEFROMFD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageSourceCreateFromFd001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageSourceCreateFromFd()
      console.error("====>ImageSourceCreateFromFd001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   ImageSourceCreateFromData001
     * @tc.number SUB_IMAGESOURCECREATEFROMDATA_0100
     * @tc.desc   test IMAGESOURCECREATEFROMDATA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageSourceCreateFromData001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageSourceCreateFromData()
      console.error("====>ImageSourceCreateFromData001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   ImageSourceCreateFromRawFile001
     * @tc.number SUB_IMAGESOURCECREATEFROMRAWFILE_0100
     * @tc.desc   test IMAGESOURCECREATEFROMRAWFILE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageSourceCreateFromRawFile001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageSourceCreateFromRawFile()
      console.error("====>ImageSourceCreateFromRawFile001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   ImageSourceCreateIncremental001
     * @tc.number SUB_IMAGESOURCECREATEINCREMENTAL_0100
     * @tc.desc   test IMAGESOURCECREATEINCREMENTAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageSourceCreateIncremental001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageSourceCreateIncremental()
      console.error("====>ImageSourceCreateIncremental001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   ImageSourceCreateIncrementalFromData001
     * @tc.number SUB_IMAGESOURCECREATEINCREMENTALFROMDATA_0100
     * @tc.desc   test IMAGESOURCECREATEINCREMENTALFROMDATA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageSourceCreateIncrementalFromData001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageSourceCreateIncrementalFromData()
      console.error("====>ImageSourceCreateIncrementalFromData001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   ImageSourceGetSupportedFormats001
     * @tc.number SUB_IMAGESOURCEGETSUPPORTEDFORMATS_0100
     * @tc.desc   test IMAGESOURCEGETSUPPORTEDFORMATS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageSourceGetSupportedFormats001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageSourceGetSupportedFormats()
      console.error("====>ImageSourceGetSupportedFormats001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   ImageSourceCreatePixelMap001
     * @tc.number SUB_IMAGESOURCECREATEPIXELMAP_0100
     * @tc.desc   test IMAGESOURCECREATEPIXELMAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageSourceCreatePixelMap001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageSourceCreatePixelMap()
      console.error("====>ImageSourceCreatePixelMap001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   ImageSourceCreatePixelMapList001
     * @tc.number SUB_IMAGESOURCECREATEPIXELMAPLIST_0100
     * @tc.desc   test IMAGESOURCECREATEPIXELMAPLIST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageSourceCreatePixelMapList001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageSourceCreatePixelMapList()
      console.error("====>ImageSourceCreatePixelMapList001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   ImageSource_GetDelayTime001
     * @tc.number SUB_IMAGESOURCEGETDELAYTIME_0100
     * @tc.desc   test IMAGESOURCEGETDELAYTIME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageSource_GetDelayTime001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageSource_GetDelayTime()
      console.error("====>ImageSource_GetDelayTime001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   ImageSourceGetFrameCount001
     * @tc.number SUB_IMAGESOURCEGETFRAMECOUNT_0100
     * @tc.desc   test IMAGESOURCEGETFRAMECOUNT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageSourceGetFrameCount001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ReceiverRelease()
      console.error("====>ImageSourceGetFrameCount001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   ImageSourceGetImageInfo001
     * @tc.number SUB_IMAGESOURCEGETIMAGEINFO_0100
     * @tc.desc   test IMAGESOURCEGETIMAGEINFO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageSourceGetImageInfo001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageSourceGetImageInfo()
      console.error("====>ImageSourceGetImageInfo001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   ImageSourceGetImageProperty001
     * @tc.number SUB_IMAGESOURCEGETIMAGPOPERTY_0100
     * @tc.desc   test IMAGESOURCEGETIMAGPOPERTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageSourceGetImageProperty001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageSourceGetImageProperty()
      console.error("====>ImageSourceGetImageProperty001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   ImageSourceModifyImageProperty001
     * @tc.number SUB_IMAGESOURCEMODIFYIMAGEPROPERTY_0100
     * @tc.desc   test IMAGESOURCEMODIFYIMAGEPROPERTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageSourceModifyImageProperty001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageSourceModifyImageProperty()
      console.error("====>ImageSourceModifyImageProperty001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   ImageSourceUpdateData001
     * @tc.number SUB_IMAGESOURCEUPDATEDATA_0100
     * @tc.desc   test IMAGESOURCEUPDATEDATA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageSourceUpdateData001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageSourceUpdateData()
      console.error("====>ImageSourceUpdateData001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   ImageSourceRelease001
     * @tc.number SUB_IMAGESOURCERELEASE_0100
     * @tc.desc   test IMAGESOURCERELEASE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageSourceRelease001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.ImageSourceRelease()
      console.error("====>ImageSourceRelease001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
  })
}
