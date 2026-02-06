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

import cameraObj from '@ohos.multimedia.camera';
import featureAbility from '@ohos.ability.featureAbility';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import {UiDriver, BY, UiComponent} from '@ohos.UiTest'
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import ndkTest from 'libentry.so'
import common from '@ohos.app.ability.common';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { BusinessError } from '@kit.BasicServicesKit';
import { image } from '@kit.ImageKit';
import { PermissionRequestResult, Permissions } from '@kit.AbilityKit';
import { JSON } from '@kit.ArkTS';
import fs from '@ohos.file.fs';
import resourceManager from '@ohos.resourceManager';
import { camera } from '@kit.CameraKit';

let sleep = (ms?: number | undefined): Promise<void> => {
  return new Promise(resolve => setTimeout(resolve, ms));
}

export default function ImageSourceNativeErrorCodeTest() {

  describe('ImageSourceNativeErrorCodeTest', () => {
    let outBuffer: ArrayBuffer = new ArrayBuffer(1200000)
    let testContext: common.UIAbilityContext;
    let filePath: string;
    let fileFd: number;
    let buffer: ArrayBuffer;
    let filesDir: string | undefined

    beforeAll(async () => {
      testContext = AppStorage.get<common.UIAbilityContext>('thisContext') as common.UIAbilityContext;
      filesDir = AppStorage.get('pathDir');
    });
    beforeEach(() => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
      await sleep(200);
    });
    afterAll(() => {
      console.info('afterAll case');
    });

    const getFd = async (fileName: string) => {
      filePath = filesDir + '/' + fileName;
      console.log('filePath:', filePath)

      //resfile下面文件 只有只读权限 copy到沙箱下面在操作.注意:测试图片放到resfile下，不要放到rawfile下。
      if(!fs.accessSync(filePath)){
        let desPath = testContext.filesDir + '/';
        if (!fs.accessSync(desPath)) {
          fs.mkdirSync(desPath)
        }
        let srcPath = testContext.resourceDir + '/';
        fs.copyDirSync(srcPath, desPath, 0);
      }
      let file = fs.openSync(filePath, fs.OpenMode.READ_WRITE );
      fileFd = file.fd;
      console.log('fileFd is:', fileFd)
    }

    const getBuffer = async (fileName: string) => {
      filePath = filesDir + '/' + fileName;
      console.log('filePath:', filePath)
      //resfile下面文件 只有只读权限 copy到沙箱下面在操作.注意:测试图片放到resfile下，不要放到rawfile下。
      if(!fs.accessSync(filePath)){
        let srcPath = testContext.resourceDir;
        let desPath = testContext.filesDir;
        if (!fs.accessSync(desPath)) {
          fs.mkdirSync(desPath)
        }
        fs.copyDirSync(srcPath, desPath, 0);
      }
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead)
      buffer = bufferRead
    }

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGEDYNAMICRANGE_AUTO_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGEDYNAMICRANGE_AUTO_0100
     * @tc.desc     : Test the IMAGE_DYNAMIC_RANGE_AUTO in the enumeration IMAGE_DYNAMIC_RANGE.
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGEDYNAMICRANGE_AUTO_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeImageDynamicRangeAuto();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGEDYNAMICRANGE_SDR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGEDYNAMICRANGE_SDR_0100
     * @tc.desc     : Test the IMAGE_DYNAMIC_RANGE_SDR in the enumeration IMAGE_DYNAMIC_RANGE.
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGEDYNAMICRANGE_SDR_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeImageDynamicRangeHDR();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGEDYNAMICRANGE_HDR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGEDYNAMICRANGE_HDR_0100
     * @tc.desc     : Test the IMAGE_DYNAMIC_RANGE_HDR in the enumeration IMAGE_DYNAMIC_RANGE.
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGEDYNAMICRANGE_HDR_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeImageDynamicRangeHDR();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGEALLOCATORTYPE_AUTO_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGEALLOCATORTYPE_AUTO_0100
     * @tc.desc     : Test the IMAGE_ALLOCATOR_TYPE_AUTO in the enumeration IMAGE_ALLOCATOR_TYPE.
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGEALLOCATORTYPE_AUTO_0100", Level.LEVEL3, async (done: Function) => {
      await getFd('test51.jpg');
      let res: number = ndkTest.jsImageSoureNativeImageAllocatorTypeAuto(filePath);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGEALLOCATORTYPE_DMA_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGEALLOCATORTYPE_DMA_0100
     * @tc.desc     : Test the IMAGE_ALLOCATOR_TYPE_DMA in the enumeration IMAGE_ALLOCATOR_TYPE.
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGEALLOCATORTYPE_DMA_0100", Level.LEVEL3, async (done: Function) => {
      await getFd('test51.jpg');
      let res: number = ndkTest.jsImageSoureNativeImageAllocatorTypeDMA(filePath);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGEALLOCATORTYPE_SHAREMEMORY_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGEALLOCATORTYPE_SHAREMEMORY_0100
     * @tc.desc     : Test the IMAGE_ALLOCATOR_TYPE_SHARE_MEMORY in the enumeration IMAGE_ALLOCATOR_TYPE.
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGEALLOCATORTYPE_SHAREMEMORY_0100", Level.LEVEL3, async (done: Function) => {
      await getFd('test51.jpg');
      let res: number = ndkTest.jsImageSoureNativeImageAllocatorTypeShareMemory(filePath);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGECROPANDSCALESTRATEGY_SCALEFIRST_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGECROPANDSCALESTRATEGY_SCALEFIRST_0100
     * @tc.desc     : Test the IMAGE_CROP_AND_SCALE_STRATEGY_SCALE_FIRST in the enumeration Image_CropAndScaleStrategy.
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGECROPANDSCALESTRATEGY_SCALEFIRST_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeImageCropAndScaleStrategyScaleFirst();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGECROPANDSCALESTRATEGY_CROPFIRST_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGECROPANDSCALESTRATEGY_CROPFIRST_0100
     * @tc.desc     : Test the IMAGE_CROP_AND_SCALE_STRATEGY_CROP_FIRST in the enumeration Image_CropAndScaleStrategy.
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGECROPANDSCALESTRATEGY_CROPFIRST_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeImageCropAndScaleStrategyCropFirst();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGESOURCEINFO_GETWIDTH_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGESOURCEINFO_GETWIDTH_0100
     * @tc.desc     : OH_ImageSourceInfo_GetWidth return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGESOURCEINFO_GETWIDTH_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeImageSourceInfoGetWidth();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGESOURCEINFO_GETWIDTH_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGESOURCEINFO_GETWIDTH_0200
     * @tc.desc     : OH_ImageSourceInfo_GetWidth return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGESOURCEINFO_GETWIDTH_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeImageSourceInfoGetWidthBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGESOURCEINFO_GETHEIGHT_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGESOURCEINFO_GETHEIGHT_0100
     * @tc.desc     : OH_ImageSourceInfo_GetHeight return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGESOURCEINFO_GETHEIGHT_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeImageSourceInfoGetHeight();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGESOURCEINFO_GETHEIGHT_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGESOURCEINFO_GETHEIGHT_0200
     * @tc.desc     : OH_ImageSourceInfo_GetHeight return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGESOURCEINFO_GETHEIGHT_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeImageSourceInfoGetHeightBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGESOURCEINFO_GETDYNAMICRANGE_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGESOURCEINFO_GETDYNAMICRANGE_0100
     * @tc.desc     : OH_ImageSourceInfo_GetDynamicRange return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGESOURCEINFO_GETDYNAMICRANGE_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeImageSourceInfoGetDynamicRange();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGESOURCEINFO_GETDYNAMICRANGE_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGESOURCEINFO_GETDYNAMICRANGE_0200
     * @tc.desc     : OH_ImageSourceInfo_GetDynamicRange return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGESOURCEINFO_GETDYNAMICRANGE_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeImageSourceInfoGetDynamicRangeBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGESOURCEINFO_GETMIMETYPE_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGESOURCEINFO_GETMIMETYPE_0100
     * @tc.desc     : OH_ImageSourceInfo_GetMimeType return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGESOURCEINFO_GETMIMETYPE_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeImageSourceInfoGetMimeType();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGESOURCEINFO_RELEASE_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGESOURCEINFO_RELEASE_0100
     * @tc.desc     : OH_ImageSourceInfo_Release return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGESOURCEINFO_RELEASE_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeImageSourceInfoRelease();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGESOURCEINFO_RELEASE_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGESOURCEINFO_RELEASE_0200
     * @tc.desc     : OH_ImageSourceInfo_Release return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_IMAGESOURCEINFO_RELEASE_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeImageSourceInfoReleasBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETPIXELFORMAT_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETPIXELFORMAT_0100
     * @tc.desc     : OH_DecodingOptions_GetPixelFormat return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETPIXELFORMAT_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsGetPixelFormat();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETPIXELFORMAT_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETPIXELFORMAT_0200
     * @tc.desc     : OH_DecodingOptions_GetPixelFormat return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETPIXELFORMAT_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsGetPixelFormatBadParameter();
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETPIXELFORMAT_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETPIXELFORMAT_0200
     * @tc.desc     : OH_DecodingOptions_SetPixelFormat return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETPIXELFORMAT_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsSetPixelFormatBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETINDEX_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETINDEX_0100
     * @tc.desc     : OH_DecodingOptions_GetIndex return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETINDEX_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsGetIndex();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETINDEX_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETINDEX_0200
     * @tc.desc     : OH_DecodingOptions_GetIndex return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETINDEX_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsGetIndexBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETINDEX_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETINDEX_0100
     * @tc.desc     : OH_DecodingOptions_SetIndex return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETINDEX_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsSetIndex();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETINDEX_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETINDEX_0200
     * @tc.desc     : OH_DecodingOptions_SetIndex return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETINDEX_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsSetIndexBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETROTATE_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETROTATE_0100
     * @tc.desc     : OH_DecodingOptions_GetRotate return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETROTATE_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsGetRotate();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETROTATE_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETROTATE_0200
     * @tc.desc     : OH_DecodingOptions_GetRotate return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETROTATE_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsGetRotateBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETROTATE_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETROTATE_0100
     * @tc.desc     : OH_DecodingOptions_SetRotate return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETROTATE_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsSetRotate();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETROTATE_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETROTATE_0200
     * @tc.desc     : OH_DecodingOptions_SetRotate return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETROTATE_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsSetRotateBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETDESIREDSIZE_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETDESIREDSIZE_0100
     * @tc.desc     : OH_DecodingOptions_GetDesiredSize return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETDESIREDSIZE_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsGetDesiredSize();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETDESIREDSIZE_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETDESIREDSIZE_0200
     * @tc.desc     : OH_DecodingOptions_GetDesiredSize return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETDESIREDSIZE_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsGetDesiredSizeBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETDESIREDSIZE_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETDESIREDSIZE_0200
     * @tc.desc     : OH_DecodingOptions_SetDesiredSize return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETDESIREDSIZE_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsSetDesiredSizeBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETDESIREDREGION_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETDESIREDREGION_0100
     * @tc.desc     : OH_DecodingOptions_GetDesiredRegion return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETDESIREDREGION_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsGetDesiredRegion();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETDESIREDREGION_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETDESIREDREGION_0200
     * @tc.desc     : OH_DecodingOptions_GetDesiredRegion return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETDESIREDREGION_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsGetDesiredRegionBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETDESIREDREGION_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETDESIREDREGION_0100
     * @tc.desc     : OH_DecodingOptions_SetDesiredRegion return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETDESIREDREGION_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsSetDesiredRegion();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETDESIREDREGION_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETDESIREDREGION_0200
     * @tc.desc     : OH_DecodingOptions_SetDesiredRegion return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETDESIREDREGION_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsSetDesiredRegionBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETDESIREDDYNAMICRANGE_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETDESIREDDYNAMICRANGE_0100
     * @tc.desc     : OH_DecodingOptions_GetDesiredDynamicRange return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETDESIREDDYNAMICRANGE_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsGetDesiredDynamicRange();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETDESIREDDYNAMICRANGE_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETDESIREDDYNAMICRANGE_0200
     * @tc.desc     : OH_DecodingOptions_GetDesiredDynamicRange return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETDESIREDDYNAMICRANGE_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsGetDesiredDynamicRangeBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETDESIREDDYNAMICRANGE_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETDESIREDDYNAMICRANGE_0100
     * @tc.desc     : OH_DecodingOptions_SetDesiredDynamicRange return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETDESIREDDYNAMICRANGE_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsSetDesiredDynamicRange();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETDESIREDDYNAMICRANGE_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETDESIREDDYNAMICRANGE_0200
     * @tc.desc     : OH_DecodingOptions_SetDesiredDynamicRange return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETDESIREDDYNAMICRANGE_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsSetDesiredDynamicRangeBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETCROPANDSCALESTRATEGY_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETCROPANDSCALESTRATEGY_0100
     * @tc.desc     : OH_DecodingOptions_SetCropAndScaleStrategy return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETCROPANDSCALESTRATEGY_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsSetCropAndScaleStrategy();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETCROPANDSCALESTRATEGY_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETCROPANDSCALESTRATEGY_0200
     * @tc.desc     : OH_DecodingOptions_SetCropAndScaleStrategy return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETCROPANDSCALESTRATEGY_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsSetCropAndScaleStrategyBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETCROPANDSCALESTRATEGY_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETCROPANDSCALESTRATEGY_0100
     * @tc.desc     : OH_DecodingOptions_GetCropAndScaleStrategy return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETCROPANDSCALESTRATEGY_0100", Level.LEVEL3,  async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsGetCropAndScaleStrategy();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETCROPANDSCALESTRATEGY_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETCROPANDSCALESTRATEGY_0200
     * @tc.desc     : OH_DecodingOptions_GetCropAndScaleStrategy return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETCROPANDSCALESTRATEGY_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsGetCropAndScaleStrategyBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETCROPREGION_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETCROPREGION_0200
     * @tc.desc     : OH_DecodingOptions_SetCropRegion return IMAGE_SOURCE_INVALID_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETCROPREGION_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsSetCropRegionInvaildParamter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETCROPREGION_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETCROPREGION_0200
     * @tc.desc     : OH_DecodingOptions_GetCropRegion return IMAGE_SOURCE_INVALID_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETCROPREGION_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsGetCropRegionInvaildParamter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETDESIREDCOLORSPACE_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETDESIREDCOLORSPACE_0100
     * @tc.desc     : OH_DecodingOptions_GetDesiredColorSpace return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETDESIREDCOLORSPACE_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsGetDesiredColorSpace();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETDESIREDCOLORSPACE_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETDESIREDCOLORSPACE_0200
     * @tc.desc     : OH_DecodingOptions_GetDesiredColorSpace return IMAGE_SOURCE_INVALID_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_GETDESIREDCOLORSPACE_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsGetDesiredColorSpaceInvaildParamter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETDESIREDCOLORSPACE_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETDESIREDCOLORSPACE_0100
     * @tc.desc     : OH_DecodingOptions_SetDesiredColorSpace return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETDESIREDCOLORSPACE_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsSetDesiredColorSpace();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETDESIREDCOLORSPACE_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETDESIREDCOLORSPACE_0200
     * @tc.desc     : OH_DecodingOptions_SetDesiredColorSpace return IMAGE_SOURCE_INVALID_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_SETDESIREDCOLORSPACE_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsSetDesiredColorSpaceInvaildParamter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_RELEASE_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_RELEASE_0100
     * @tc.desc     : OH_DecodingOptions_Release return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_RELEASE_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsRelease();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_RELEASE_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_RELEASE_0200
     * @tc.desc     : OH_DecodingOptions_Release return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONS_RELEASE_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsReleaseBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEFROMURI_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEFROMURI_0100
     * @tc.desc     : OH_ImageSourceNative_CreateFromUri return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEFROMURI_0100", Level.LEVEL3, async (done: Function) => {
      await getFd('test51.jpg');
      let res: number = ndkTest.jsImageSoureNativeCreateFromUri(filePath);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEFROMURI_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEFROMURI_0200
     * @tc.desc     : OH_ImageSourceNative_CreateFromUri return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEFROMURI_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeCreateFromUriBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEFROMFD_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEFROMFD_0200
     * @tc.desc     : OH_ImageSourceNative_CreateFromFd return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEFROMFD_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeCreateFromFdBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEFROMDATA_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEFROMDATA_0100
     * @tc.desc     : OH_ImageSourceNative_CreateFromData return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEFROMDATA_0100", Level.LEVEL3, async (done: Function) => {
      await getBuffer('test51.jpg');
      let res: number = ndkTest.jsImageSoureNativeCreateFromData(buffer);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEFROMDATA_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEFROMDATA_0200
     * @tc.desc     : OH_ImageSourceNative_CreateFromData return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEFROMDATA_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeCreateFromDataBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEFROMDATAWithUSERBUFFER_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEFROMDATAWithUSERBUFFER_0100
     * @tc.desc     : OH_ImageSourceNative_CreateFromDataWithUserBuffer return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEFROMDATAWithUSERBUFFER_0100", Level.LEVEL3, async (done: Function) => {
      await getBuffer('test51.jpg');
      let res: number = ndkTest.jsImageSoureNativeCreateFromDataWithUserBuffer(buffer);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEFROMDATAWithUSERBUFFER_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEFROMDATAWithUSERBUFFER_0200
     * @tc.desc     : OH_ImageSourceNative_CreateFromDataWithUserBuffer return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEFROMDATAWithUSERBUFFER_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeCreateFromDataWithUserBufferInvaildParamter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEFROMRAWFILE_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEFROMRAWFILE_0200
     * @tc.desc     : OH_ImageSourceNative_CreateFromRawFile return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEFROMRAWFILE_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeCreateFromRawFileBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEPIXELMAP_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEPIXELMAP_0200
     * @tc.desc     : OH_ImageSourceNative_CreatePixelmap return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEPIXELMAP_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeCreatePixelmapBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEPIXELMAPUSINGALLOCATOR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEPIXELMAPUSINGALLOCATOR_0200
     * @tc.desc     : OH_ImageSourceNative_CreatePixelmapUsingAllocator return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEPIXELMAPUSINGALLOCATOR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeCreatePixelmapUsingAllocatorBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEPIXELMAPUSINGALLOCATOR_0300
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEPIXELMAPUSINGALLOCATOR_0300
     * @tc.desc     : OH_ImageSourceNative_CreatePixelmapUsingAllocator return IMAGE_SOURCE_UNSUPPORTED_ALLOCATOR_TYPE
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEPIXELMAPUSINGALLOCATOR_0300", Level.LEVEL3, async (done: Function) => {
      await getFd('test51.jpg');
      let res: number = ndkTest.jsImageSoureNativeCreatePixelmapUsingAllocatorUnsuportedAllocatorType(filePath);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEPIXELMAPLIST_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEPIXELMAPLIST_0100
     * @tc.desc     : OH_ImageSourceNative_CreatePixelmapList return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEPIXELMAPLIST_0100", Level.LEVEL3, async (done: Function) => {
      await getFd('test51.jpg');
      let res: number = ndkTest.jsImageSoureNativeCreatePixelmapList(filePath);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEPIXELMAPLIST_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEPIXELMAPLIST_0200
     * @tc.desc     : OH_ImageSourceNative_CreatePixelmapList return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEPIXELMAPLIST_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeCreatePixelmapListBadParameter();
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEPICTURE_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEPICTURE_0100
     * @tc.desc     : OH_ImageSourceNative_CreatePicture return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEPICTURE_0100", Level.LEVEL3, async (done: Function) => {
      await getFd('test51.jpg');
      let res: number = ndkTest.jsImageSoureNativeCreatePicture(filePath);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEPICTURE_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEPICTURE_0200
     * @tc.desc     : OH_ImageSourceNative_CreatePicture return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEPICTURE_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeCreatePictureBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEPICTUREATINDEX_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEPICTUREATINDEX_0100
     * @tc.desc     : OH_ImageSourceNative_CreatePictureAtIndex return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEPICTUREATINDEX_0100", Level.LEVEL3, async (done: Function) => {
      await getFd('test61.gif');
      let res: number = ndkTest.jsImageSoureNativeCreatePictureAtIndex(filePath);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEPICTUREATINDEX_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEPICTUREATINDEX_0200
     * @tc.desc     : OH_ImageSourceNative_CreatePictureAtIndex return IMAGE_BAD_SOURCE
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEPICTUREATINDEX_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeCreatePictureAtIndexBadSource();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEPICTUREATINDEX_0300
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEPICTUREATINDEX_0300
     * @tc.desc     : OH_ImageSourceNative_CreatePictureAtIndex return IMAGE_SOURCE_UNSUPPORTED_OPTIONS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_CREATEPICTUREATINDEX_0300", Level.LEVEL3, async (done: Function) => {
      await getFd('test51.jpg');
      let res: number = ndkTest.jsImageSoureNativeCreatePictureAtIndexUnsuportedOptions(filePath);
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_GETDELAYTIMELIST_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_GETDELAYTIMELIST_0100
     * @tc.desc     : OH_ImageSourceNative_GetDelayTimeList return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_GETDELAYTIMELIST_0100", Level.LEVEL3, async (done: Function) => {
      await getFd('test61.gif');
      let res: number = ndkTest.jsImageSoureNativeGetDelayTimeList(filePath);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_GETDELAYTIMELIST_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_GETDELAYTIMELIST_0200
     * @tc.desc     : OH_ImageSourceNative_GetDelayTimeList return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_GETDELAYTIMELIST_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeGetDelayTimeListBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_GETIMAGEINFO_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_GETIMAGEINFO_0100
     * @tc.desc     : OH_ImageSourceNative_GetImageInfo return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_GETIMAGEINFO_0100", Level.LEVEL3, async (done: Function) => {
      await getFd('test61.gif');
      let res: number = ndkTest.jsImageSoureNativeGetImageInfo(filePath);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_GETIMAGEINFO_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_GETIMAGEINFO_0200
     * @tc.desc     : OH_ImageSourceNative_GetImageInfo return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_GETIMAGEINFO_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeGetImageInfoBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_GETIMAGEPROPERTY_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_GETIMAGEPROPERTY_0200
     * @tc.desc     : OH_ImageSourceNative_GetImageProperty return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_GETIMAGEPROPERTY_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeGetImagePropertyBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_GETIMAGEPROPERTY_0300
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_GETIMAGEPROPERTY_0300
     * @tc.desc     : OH_ImageSourceNative_GetImageProperty return IMAGE_ALLOC_FAILED
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_GETIMAGEPROPERTY_0300", Level.LEVEL3, async (done: Function) => {
      await getFd('test_exif_v21.jpg');
      let res: number = ndkTest.jsImageSoureNativeGetImagePropertyAllocFailed(filePath,image.PropertyKey.SCENE_TYPE);
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_GETIMAGEPROPERTYWITHNULL_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_GETIMAGEPROPERTYWITHNULL_0200
     * @tc.desc     : OH_ImageSourceNative_GetImagePropertyWithNull return IMAGE_SOURCE_INVALID_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_GETIMAGEPROPERTYWITHNULL_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeGetImagePropertyWithNullInvaildParamter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_MODIFYIMAGEPROPERTY_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_MODIFYIMAGEPROPERTY_0100
     * @tc.desc     : OH_ImageSourceNative_ModifyImageProperty return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_MODIFYIMAGEPROPERTY_0100", Level.LEVEL3, async (done: Function) => {
      await getFd('test51.jpg');
      let res: number = ndkTest.jsImageSoureNativeModifyImageProperty(filePath);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_MODIFYIMAGEPROPERTY_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_MODIFYIMAGEPROPERTY_0200
     * @tc.desc     : OH_ImageSourceNative_ModifyImageProperty return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_MODIFYIMAGEPROPERTY_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeModifyImagePropertyBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_GETFRAMECOUNT_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_GETFRAMECOUNT_0100
     * @tc.desc     : OH_ImageSourceNative_GetFrameCount return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_GETFRAMECOUNT_0100", Level.LEVEL3, async (done: Function) => {
      await getFd('test61.gif');
      let res: number = ndkTest.jsImageSoureNativeGetFrameCount(filePath);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_GETFRAMECOUNT_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_GETFRAMECOUNT_0200
     * @tc.desc     : OH_ImageSourceNative_GetFrameCount return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_GETFRAMECOUNT_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeGetFrameCountBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_RELEASE_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_RELEASE_0100
     * @tc.desc     : OH_ImageSourceNative_Release return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_RELEASE_0100", Level.LEVEL3, async (done: Function) => {
      await getFd('test61.gif');
      let res: number = ndkTest.jsImageSoureNativeRelease(filePath);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_RELEASE_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_RELEASE_0200
     * @tc.desc     : OH_ImageSourceNative_Release return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_RELEASE_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeReleaseBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONSFORPICTURE_CREATE_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONSFORPICTURE_CREATE_0200
     * @tc.desc     : OH_DecodingOptionsForPicture_Create return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONSFORPICTURE_CREATE_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsForPictureCreateBadParameter();
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONSFORPICTURE_GETDESIREDAUXILIARYPICTURES_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONSFORPICTURE_GETDESIREDAUXILIARYPICTURES_0100
     * @tc.desc     : OH_DecodingOptionsForPicture_GetDesiredAuxiliaryPictures return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONSFORPICTURE_GETDESIREDAUXILIARYPICTURES_0100", Level.LEVEL3, async (done: Function) => {
      let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP,
        image.AuxiliaryPictureType.DEPTH_MAP, image.AuxiliaryPictureType.UNREFOCUS_MAP,
        image.AuxiliaryPictureType.LINEAR_MAP, image.AuxiliaryPictureType.FRAGMENT_MAP];

      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsForPictureGetDesiredAuxiliaryPictures(inAuxTpyes.length, inAuxTpyes);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONSFORPICTURE_GETDESIREDAUXILIARYPICTURES_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONSFORPICTURE_GETDESIREDAUXILIARYPICTURES_0200
     * @tc.desc     : OH_DecodingOptionsForPicture_GetDesiredAuxiliaryPictures return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONSFORPICTURE_GETDESIREDAUXILIARYPICTURES_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsForPictureGetDesiredAuxiliaryPicturesBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONSFORPICTURE_SETDESIREDAUXILIARYPICTURES_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONSFORPICTURE_SETDESIREDAUXILIARYPICTURES_0100
     * @tc.desc     : OH_DecodingOptionsForPicture_SetDesiredAuxiliaryPictures return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONSFORPICTURE_SETDESIREDAUXILIARYPICTURES_0100", Level.LEVEL3, async (done: Function) => {
      let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP,
        image.AuxiliaryPictureType.DEPTH_MAP, image.AuxiliaryPictureType.UNREFOCUS_MAP,
        image.AuxiliaryPictureType.LINEAR_MAP, image.AuxiliaryPictureType.FRAGMENT_MAP];
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsForPictureSetDesiredAuxiliaryPictures(inAuxTpyes.length, inAuxTpyes);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONSFORPICTURE_SETDESIREDAUXILIARYPICTURES_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONSFORPICTURE_SETDESIREDAUXILIARYPICTURES_0200
     * @tc.desc     : OH_DecodingOptionsForPicture_SetDesiredAuxiliaryPictures return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONSFORPICTURE_SETDESIREDAUXILIARYPICTURES_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsForPictureSetDesiredAuxiliaryPicturesBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONSFORPICTURE_RELESAE_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONSFORPICTURE_RELESAE_0100
     * @tc.desc     : OH_DecodingOptionsForPicture_Release return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONSFORPICTURE_RELESAE_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsForPictureRelease();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONSFORPICTURE_RELESAE_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONSFORPICTURE_RELESAE_0200
     * @tc.desc     : OH_DecodingOptionsForPicture_Release return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONSFORPICTURE_RELESAE_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeDecodingOptionsForPictureReleaseBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONSFORPICTURE_GETSUPPORTEDFORMATS_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONSFORPICTURE_GETSUPPORTEDFORMATS_0100
     * @tc.desc     : OH_ImageSourceNative_GetSupportedFormats return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONSFORPICTURE_GETSUPPORTEDFORMATS_0100", Level.LEVEL3, async (done: Function) => {
      await getFd('test61.gif');
      let res: number = ndkTest.jsImageSoureNativeGetSupportedFormats(filePath);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONSFORPICTURE_GETSUPPORTEDFORMATS_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONSFORPICTURE_GETSUPPORTEDFORMATS_0200
     * @tc.desc     : OH_ImageSourceNative_GetSupportedFormats return IMAGE_SOURCE_INVALID_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCE_NATIVE_DECODINGOPTIONSFORPICTURE_GETSUPPORTEDFORMATS_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageSoureNativeGetSupportedFormatsInvalidParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_testPictureNative_CreatePicture
     * @tc.name     : SUB_testPictureNative_CreatePicture
     * @tc.desc     : OH_PictureNative_CreatePicture return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_testPictureNative_CreatePicture", Level.LEVEL3, async (done: Function) => {
      await getFd('test61.gif');
      let res: number = ndkTest.testPictureNative_CreatePicture(filePath);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_testPictureNative_GetMainPixelmap
     * @tc.name     : SUB_testPictureNative_GetMainPixelmap
     * @tc.desc     : OH_PictureNative_GetMainPixelmap return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_testPictureNative_GetMainPixelmap", Level.LEVEL3, async (done: Function) => {
      await getFd('test61.gif');
      let res: number = ndkTest.testPictureNative_GetMainPixelmap(filePath);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_testPictureNative_GetHdrComposedPixelmap
     * @tc.name     : SUB_testPictureNative_GetHdrComposedPixelmap
     * @tc.desc     : OH_PictureNative_GetHdrComposedPixelmap return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_testPictureNative_GetHdrComposedPixelmap", Level.LEVEL3, async (done: Function) => {
      await getFd('test61.gif');
      let res: number = ndkTest.testPictureNative_GetHdrComposedPixelmap(filePath);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_testPictureNative_GetGainmapPixelmap
     * @tc.name     : SUB_testPictureNative_GetGainmapPixelmap
     * @tc.desc     : OH_PictureNative_GetGainmapPixelmap return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_testPictureNative_GetGainmapPixelmap", Level.LEVEL3, async (done: Function) => {
      await getFd('test61.gif');
      let res: number = ndkTest.testPictureNative_GetGainmapPixelmap(filePath);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_testPictureNative_SetAuxiliaryPicture
     * @tc.name     : SUB_testPictureNative_SetAuxiliaryPicture
     * @tc.desc     : OH_PictureNative_SetAuxiliaryPicture return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_testPictureNative_SetAuxiliaryPicture", Level.LEVEL3, async (done: Function) => {
      await getFd('test61.gif');
      let auxPicture :image.AuxiliaryPicture
      let res: number = ndkTest.testPictureNative_SetAuxiliaryPicture(filePath);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_testPictureNative_GetAuxiliaryPicture
     * @tc.name     : SUB_testPictureNative_GetAuxiliaryPicture
     * @tc.desc     : OH_PictureNative_GetAuxiliaryPicture return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_testPictureNative_GetAuxiliaryPicture", Level.LEVEL3, async (done: Function) => {
      await getFd('test61.gif');
      let res: number = ndkTest.testPictureNative_GetAuxiliaryPicture(filePath);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_testPictureNative_GetMetadata
     * @tc.name     : SUB_testPictureNative_GetMetadata
     * @tc.desc     : Test OH_PictureNative_GetMetadata return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_testPictureNative_GetMetadata", Level.LEVEL3, async (done: Function) => {
      await getFd('test61.gif');
      let res: number = ndkTest.testPictureNative_GetMetadata(filePath);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_testPictureNative_SetMetadata
     * @tc.name     : SUB_testPictureNative_SetMetadata
     * @tc.desc     : Test OH_PictureNative_SetMetadata return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_testPictureNative_SetMetadata", Level.LEVEL3, async (done: Function) => {
      await getFd('test61.gif');
      let res: number = ndkTest.testPictureNative_SetMetadata(filePath);
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.number   : SUB_testPictureNative_Release
     * @tc.name     : SUB_testPictureNative_Release
     * @tc.desc     : Test OH_PictureNative_Release return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_testPictureNative_Release", Level.LEVEL3, async (done: Function) => {
      await getFd('test61.gif');
      let res: number = ndkTest.testPictureNative_Release(filePath);
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.number   : SUB_testAuxiliaryPictureNativeWritePixelsImage
     * @tc.name     : SUB_testAuxiliaryPictureNativeWritePixelsImage
     * @tc.desc     : Test OH_AuxiliaryPictureNativeWritePixelsImage return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_testAuxiliaryPictureNativeWritePixelsImage", Level.LEVEL3, async (done: Function) => {
      await getFd('test61.gif');
      let res: number = ndkTest.testAuxiliaryPictureNativeWritePixelsImage(filePath);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_testAuxiliaryPictureNative_ReadPixels
     * @tc.name     : SUB_testAuxiliaryPictureNative_ReadPixels
     * @tc.desc     : Test OH_AuxiliaryPictureNative_ReadPixels return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_testAuxiliaryPictureNative_ReadPixels", Level.LEVEL3, async (done: Function) => {
      await getFd('test61.gif');
      let res: number = ndkTest.testAuxiliaryPictureNative_ReadPixels(filePath);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_testAuxiliaryPictureNative_GetType
     * @tc.name     : SUB_testAuxiliaryPictureNative_GetType
     * @tc.desc     : Test OH_AuxiliaryPictureNative_GetType return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_testAuxiliaryPictureNative_GetType", Level.LEVEL3, async (done: Function) => {
      await getFd('test61.gif');
      let res: number = ndkTest.testAuxiliaryPictureNative_GetType(filePath);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_testAuxiliaryPictureNative_GetInfo
     * @tc.name     : SUB_testAuxiliaryPictureNative_GetInfo
     * @tc.desc     : Test OH_AuxiliaryPictureNative_GetInfo return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_testAuxiliaryPictureNative_GetInfo", Level.LEVEL3, async (done: Function) => {
      await getFd('test61.gif');
      let res: number = ndkTest.testAuxiliaryPictureNative_GetInfo(filePath);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_testAuxiliaryPictureNative_SetInfo
     * @tc.name     : SUB_testAuxiliaryPictureNative_SetInfo
     * @tc.desc     : Test OH_AuxiliaryPictureNative_SetInfo return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_testAuxiliaryPictureNative_SetInfo", Level.LEVEL3, async (done: Function) => {
      await getFd('test61.gif');
      let res: number = ndkTest.testAuxiliaryPictureNative_SetInfo(filePath);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_testAuxiliaryPictureNative_GetMetadata
     * @tc.name     : SUB_testAuxiliaryPictureNative_GetMetadata
     * @tc.desc     : Test OH_AuxiliaryPictureNative_GetMetadata return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_testAuxiliaryPictureNative_GetMetadata", Level.LEVEL3, async (done: Function) => {
      await getFd('test61.gif');
      let res: number = ndkTest.testAuxiliaryPictureNative_GetMetadata(filePath);
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.number   : SUB_testAuxiliaryPictureNative_SetMetadata
     * @tc.name     : SUB_testAuxiliaryPictureNative_SetMetadata
     * @tc.desc     : Test OH_AuxiliaryPictureNative_SetMetadata return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_testAuxiliaryPictureNative_SetMetadata", Level.LEVEL3, async (done: Function) => {
      await getFd('test61.gif');
      let res: number = ndkTest.testAuxiliaryPictureNative_SetMetadata(filePath);
      expect(res).assertEqual(0);
      done();
    });
  })
}

function isSupportedCameras() : boolean {
  const cameraAvailable = canIUse('SystemCapability.Multimedia.Camera.Core');
  let context: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext

  let isSupportedCameras = true;
  let isSupportedCameraManager = false;
  let mCameraManager: camera.CameraManager;
  let mCameraDevicesArray: Array<camera.CameraDevice>;

  let isEmpty = (data: ESObject) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  console.info('Enter getCameraManagerInstance');
  try {
    mCameraManager = camera.getCameraManager(context);
    if (isEmpty(mCameraManager)) {
      console.info("getCameraManager FAILED");
      isSupportedCameraManager = false;
      return isSupportedCameraManager;
    }
    console.info('Exit getCameraManagerInstance');
    mCameraDevicesArray = mCameraManager.getSupportedCameras();
    if (isEmpty(mCameraDevicesArray)) {
      isSupportedCameras = false;
    }
  } catch (err) {
    console.error("getCameraManager FAILED. errorMessage:", err);
    isSupportedCameraManager = false;
    return isSupportedCameraManager;
  }
  if (cameraAvailable && isSupportedCameras) {
    isSupportedCameraManager = true;
  } else {
    isSupportedCameraManager = false;
  }
  return isSupportedCameraManager;
}