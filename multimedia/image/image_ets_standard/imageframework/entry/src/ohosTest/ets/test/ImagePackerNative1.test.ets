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




let sleep = (ms?: number | undefined): Promise<void> => {
  return new Promise(resolve => setTimeout(resolve, ms));
}

export default function ImagePackerNativeTest1() {

  describe('ImagePackerNativeTest1', () => {
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
        let srcPath = testContext.resourceDir + '/';
        let desPath = testContext.filesDir + '/';
        if (!fs.accessSync(desPath)) {
          fs.mkdirSync(desPath)
        }
        fs.copyDirSync(srcPath, desPath, 0);
      }
      let file = fs.openSync(filePath, fs.OpenMode.READ_WRITE );
      fileFd = file.fd;
      console.log('fileFd is:', fileFd)

    }


    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTODATAFROMIMAGESOURCE_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTODATAFROMIMAGESOURCE_ERROR_0100
     * @tc.desc     : OH_ImagePackerNative_PackToDataFromImageSource return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTODATAFROMIMAGESOURCE_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      const parker: image.ImagePacker = ndkTest.packerCreate();
      await getFd("test51.jpg");
      const imageSourceApi: image.ImageSource = ndkTest.createFromFd(fileFd);
      let packOpts: image.PackingOption = ndkTest.createPackingOptions();
      ndkTest.jsPackingOptionsSetQuality(packOpts, 100);
      ndkTest.jsPackingOptionsSetMimeType(packOpts, "image/jpeg");
      ndkTest.jsPackingOptionsSetNeedsPackProperties(packOpts, 1)

      let res: number = ndkTest.jsPackToDataFromImageSource(parker, packOpts, imageSourceApi, outBuffer)
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTODATAFROMIMAGESOURCE_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTODATAFROMIMAGESOURCE_ERROR_0200
     * @tc.desc     : OH_ImagePackerNative_PackToDataFromImageSource return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTODATAFROMIMAGESOURCE_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackToDataFromImageSourceBadParamter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTODATAFROMPIXELMAP_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTODATAFROMPIXELMAP_ERROR_0100
     * @tc.desc     : OH_ImagePackerNative_PackToDataFromPixelmap return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTODATAFROMPIXELMAP_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      const parker: image.ImagePacker = ndkTest.packerCreate();
      await getFd("test51.jpg");
      let packOpts: image.PackingOption = ndkTest.createPackingOptions();
      ndkTest.jsPackingOptionsSetQuality(packOpts, 100);
      ndkTest.jsPackingOptionsSetMimeType(packOpts, "image/jpeg");
      ndkTest.jsPackingOptionsSetNeedsPackProperties(packOpts, 1)

      const imagesource: image.ImageSource = ndkTest.createFromFd(fileFd);
      const DecodingOptions: image.DecodingOptions = ndkTest.createDecodingOptions();
      const pixelMap: image.PixelMap | number = ndkTest.createPixelMapWithImageSoure(imagesource, DecodingOptions);
      let res: number = ndkTest.jsPackToDataFromPixelmap(parker, packOpts, pixelMap, outBuffer);

      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTODATAFROMPIXELMAP_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTODATAFROMPIXELMAP_ERROR_0200
     * @tc.desc     : OH_ImagePackerNative_PackToDataFromPixelmap return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTODATAFROMPIXELMAP_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackToDataFromPixelmapBadParamter();
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTODATAFROMPICTURE_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTODATAFROMPICTURE_ERROR_0100
     * @tc.desc     : OH_ImagePackerNative_PackToDataFromPicture return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTODATAFROMPICTURE_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      const parker: image.ImagePacker = ndkTest.packerCreate();
      await getFd("test51.jpg");
      let packOpts: image.PackingOption = ndkTest.createPackingOptions();
      ndkTest.jsPackingOptionsSetQuality(packOpts, 100);
      ndkTest.jsPackingOptionsSetMimeType(packOpts, "image/jpeg");
      ndkTest.jsPackingOptionsSetNeedsPackProperties(packOpts, 1)

      const imagesource: image.ImageSource = ndkTest.createFromFd(fileFd);
      const DecodingOptions: image.DecodingOptions = ndkTest.createDecodingOptions();
      const pixelMap: image.PixelMap | number = ndkTest.createPixelMapWithImageSoure(imagesource, DecodingOptions);
      let res: number = ndkTest.jsPackToDataFromPicture(parker, packOpts, pixelMap, outBuffer);

      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTODATAFROMPICTURE_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTODATAFROMPICTURE_ERROR_0200
     * @tc.desc     : OH_ImagePackerNative_PackToDataFromPicture return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTODATAFROMPICTURE_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackToDataFromPictureBadParamter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTODATAFROMPIXELMAPSEQUENCE_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTODATAFROMPIXELMAPSEQUENCE_ERROR_0100
     * @tc.desc     : OH_ImagePackerNative_PackToDataFromPixelmapSequence return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTODATAFROMPIXELMAPSEQUENCE_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      const parker: image.ImagePacker = ndkTest.packerCreate();
      await getFd("test51.jpg");
      const imagesource: image.ImageSource = ndkTest.createFromFd(fileFd);
      const DecodingOptions: image.DecodingOptions = ndkTest.createDecodingOptions();
      const pixelMap: image.PixelMap | number = ndkTest.createPixelMapWithImageSoure(imagesource, DecodingOptions);

      let res: number = ndkTest.jsPackToDataFromPixelmapSequence(parker, pixelMap,outBuffer);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTODATAFROMPIXELMAPSEQUENCE_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTODATAFROMPIXELMAPSEQUENCE_ERROR_0200
     * @tc.desc     : OH_ImagePackerNative_PackToDataFromPixelmapSequence return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTODATAFROMPIXELMAPSEQUENCE_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackToDataFromPixelmapSequenceBadParamter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTOFILEFROMIMAGESOURCE_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTOFILEFROMIMAGESOURCE_ERROR_0100
     * @tc.desc     : OH_ImagePackerNative_PackToFileFromImageSource return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTOFILEFROMIMAGESOURCE_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      const parker: image.ImagePacker = ndkTest.packerCreate();
      await getFd("test51.jpg");
      const imageSourceApi: image.ImageSource = ndkTest.createFromFd(fileFd);

      let packOpts: image.PackingOption = ndkTest.createPackingOptions();
      ndkTest.jsPackingOptionsSetQuality(packOpts, 100);
      ndkTest.jsPackingOptionsSetMimeType(packOpts, "image/jpeg");
      ndkTest.jsPackingOptionsSetNeedsPackProperties(packOpts, 1)

      let res: number = ndkTest.jsPackToFileFromImageSource(parker, packOpts, imageSourceApi, fileFd);
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTOFILEFROMIMAGESOURCE_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTOFILEFROMIMAGESOURCE_ERROR_0200
     * @tc.desc     : OH_ImagePackerNative_PackToFileFromImageSource return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTOFILEFROMIMAGESOURCE_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackToFileFromImageSourceBadParamter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTOFILEFROMPIXELMAP_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTOFILEFROMPIXELMAP_ERROR_0100
     * @tc.desc     : OH_ImagePackerNative_PackToFileFromPixelmap return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTOFILEFROMPIXELMAP_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      const parker: image.ImagePacker = ndkTest.packerCreate();
      await getFd("test51.jpg");
      let packOpts: image.PackingOption = ndkTest.createPackingOptions();
      ndkTest.jsPackingOptionsSetQuality(packOpts, 100);
      ndkTest.jsPackingOptionsSetMimeType(packOpts, "image/jpeg");
      ndkTest.jsPackingOptionsSetNeedsPackProperties(packOpts, 1)

      const imagesource: image.ImageSource = ndkTest.createFromFd(fileFd);
      const DecodingOptions: image.DecodingOptions = ndkTest.createDecodingOptions();
      const pixelMap: image.PixelMap | number = ndkTest.createPixelMapWithImageSoure(imagesource, DecodingOptions);
      let res: number = ndkTest.jsPackToFileFromPixelmap(parker, packOpts, pixelMap, fileFd);

      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTOFILEFROMPIXELMAP_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTOFILEFROMPIXELMAP_ERROR_0200
     * @tc.desc     : OH_ImagePackerNative_PackToFileFromPixelmap return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTOFILEFROMPIXELMAP_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackToFileFromPixelmapBadParamter();
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTOFILEFROMPRICTURE_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTOFILEFROMPRICTURE_ERROR_0100
     * @tc.desc     : OH_ImagePackerNative_PackToFileFromPicture return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTOFILEFROMPRICTURE_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      const parker: image.ImagePacker = ndkTest.packerCreate();
      await getFd("test51.jpg");
      let packOpts: image.PackingOption = ndkTest.createPackingOptions();
      ndkTest.jsPackingOptionsSetQuality(packOpts, 100);
      ndkTest.jsPackingOptionsSetMimeType(packOpts, "image/jpeg");
      ndkTest.jsPackingOptionsSetNeedsPackProperties(packOpts, 1)

      const imagesource: image.ImageSource = ndkTest.createFromFd(fileFd);
      const DecodingOptions: image.DecodingOptions = ndkTest.createDecodingOptions();
      const pixelMap: image.PixelMap | number = ndkTest.createPixelMapWithImageSoure(imagesource, DecodingOptions);
      let res: number = ndkTest.jsPackToFileFromPicture(parker, packOpts, pixelMap, fileFd);

      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTOFILEFROMPRICTURE_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTOFILEFROMPRICTURE_ERROR_0200
     * @tc.desc     : OH_ImagePackerNative_PackToFileFromPicture return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTOFILEFROMPRICTURE_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackToFileFromPictureBadParamter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTOFILEFROMPIXELMAPSEQUENCE_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTOFILEFROMPIXELMAPSEQUENCE_ERROR_0200
     * @tc.desc     : OH_ImagePackerNative_PackToFileFromPixelmapSequence return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_PACKTOFILEFROMPIXELMAPSEQUENCE_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackToFileFromPixelmapSequenceBadParamter();
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_RELEASE_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_RELEASE_ERROR_0100
     * @tc.desc     : OH_ImagePackerNative_Release return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_RELEASE_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImagePackerNativeRelease();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_RELEASE_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_RELEASE_ERROR_0200
     * @tc.desc     : OH_ImagePackerNative_Release return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_RELEASE_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImagePackerNativeReleaseBadParamter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_GETSUPPORTEDFORMATS_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_GETSUPPORTEDFORMATS_ERROR_0100
     * @tc.desc     : OH_ImagePackerNative_GetSupportedFormats return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_GETSUPPORTEDFORMATS_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsGetSupportedFormats();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_GETSUPPORTEDFORMATS_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_GETSUPPORTEDFORMATS_ERROR_0200
     * @tc.desc     : OH_ImagePackerNative_GetSupportedFormats return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_GETSUPPORTEDFORMATS_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsGetSupportedFormatsBadParamter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OPTIONS_CREATE_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OPTIONS_CREATE_ERROR_0100
     * @tc.desc     : OH_ImageReceiverOptions_Create return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OPTIONS_CREATE_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageReceiverOptionsCreate();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OPTIONS_CREATE_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OPTIONS_CREATE_ERROR_0200
     * @tc.desc     : OH_ImageReceiverOptions_Create return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OPTIONS_CREATE_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageReceiverOptionsCreateBadParamter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OPTIONS_GETSIZE_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OPTIONS_GETSIZE_ERROR_0100
     * @tc.desc     : OH_ImageReceiverOptions_GetSize return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OPTIONS_GETSIZE_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageReceiverOptionsGetSize();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OPTIONS_SETSIZE_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OPTIONS_SETSIZE_ERROR_0100
     * @tc.desc     : OH_ImageReceiverOptions_SetSize return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OPTIONS_SETSIZE_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageReceiverOptionsSetSize();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OPTIONS_SETSIZE_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OPTIONS_SETSIZE_ERROR_0200
     * @tc.desc     : OH_ImageReceiverOptions_SetSize return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OPTIONS_SETSIZE_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageReceiverOptionsSetSizeBadParamter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OPTIONS_GETCAPACITY_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OPTIONS_GETCAPACITY_ERROR_0100
     * @tc.desc     : OH_ImageReceiverOptions_GetCapacity return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OPTIONS_GETCAPACITY_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageReceiverOptionsGetCapacitySuccess();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OPTIONS_SETCAPACITY_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OPTIONS_SETCAPACITY_ERROR_0100
     * @tc.desc     : OH_ImageReceiverOptions_SetCapacity return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OPTIONS_SETCAPACITY_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageReceiverOptionsSetCapacitySuccess();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OPTIONS_SETCAPACITY_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OPTIONS_SETCAPACITY_ERROR_0200
     * @tc.desc     : OH_ImageReceiverOptions_SetCapacity return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OPTIONS_SETCAPACITY_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageReceiverOptionsSetCapacityBadParamter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OPTIONS_RELEASE_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OPTIONS_RELEASE_ERROR_0100
     * @tc.desc     : OH_ImageReceiverOptions_Release return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OPTIONS_RELEASE_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageReceiverOptionsRelease();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_CREATE_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_CREATE_ERROR_0100
     * @tc.desc     : OH_ImageReceiverNative_Create return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_CREATE_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageReceiverNativeCreate();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_CREATE_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_RELEASE_ERROR_0200
     * @tc.desc     : OH_ImageReceiverNative_Create return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_CREATE_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageReceiverNativeCreateBadParamter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_GETRECEIVINGSURFACEID_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_GETRECEIVINGSURFACEID_ERROR_0100
     * @tc.desc     : OH_ImageReceiverNative_GetReceivingSurfaceId return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_GETRECEIVINGSURFACEID_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageReceiverNativeGetReceivingSurfaceId();
      expect(res).assertEqual(0);
      done();
    });



    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_REASLATESTIMAGE_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_REASLATESTIMAGE_ERROR_0200
     * @tc.desc     : OH_ImageReceiverNative_ReadLatestImage return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_REASLATESTIMAGE_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageReceiverNativeReadLatestImageBadParamter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_REASLATESTIMAGE_ERROR_0300
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_REASLATESTIMAGE_ERROR_0300
     * @tc.desc     : OH_ImageReceiverNative_ReadLatestImage return IMAGE_UNKNOWN_ERROR
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_REASLATESTIMAGE_ERROR_0300", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageReceiverNativeReadLatestImageUnknownError();
      expect(res).assertEqual(0);
      done();
    });



    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_REASNEXTIMAGE_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_REASNEXTIMAGE_ERROR_0200
     * @tc.desc     : OH_ImageReceiverNative_ReadNextImage return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_REASNEXTIMAGE_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageReceiverNativeReadNextImageBadParamter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_REASNEXTIMAGE_ERROR_0300
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_REASNEXTIMAGE_ERROR_0300
     * @tc.desc     : OH_ImageReceiverNative_ReadNextImage return IMAGE_UNKNOWN_ERROR
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_REASNEXTIMAGE_ERROR_0300", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageReceiverNativeReadNextImageUnknownError();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_ON_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_ON_ERROR_0100
     * @tc.desc     : OH_ImageReceiverNative_On return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_ON_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageReceiverNativeOnSuccess();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_ON_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_ON_ERROR_0200
     * @tc.desc     : OH_ImageReceiverNative_On return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_ON_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageReceiverNativeOnBadParamter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OFF_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OFF_ERROR_0100
     * @tc.desc     : OH_ImageReceiverNative_Off return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OFF_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageReceiverNativeOff();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OFF_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OFF_ERROR_0200
     * @tc.desc     : OH_ImageReceiverNative_Off return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OFF_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageReceiverNativeOffBadParamter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_ONIMAGEARRIVE_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_ONIMAGEARRIVE_ERROR_0100
     * @tc.desc     : OH_ImageReceiverNative_OnImageArrive return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_ONIMAGEARRIVE_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageReceiverNativeOnImageArrive();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_ONIMAGEARRIVE_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_ONIMAGEARRIVE_ERROR_0200
     * @tc.desc     : OH_ImageReceiverNative_OnImageArrive return IMAGE_RECEIVER_INVALID_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_ONIMAGEARRIVE_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageReceiverNativeOnImageArriveInvaildParamter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OFFIMAGEARRIVE_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OFFIMAGEARRIVE_ERROR_0100
     * @tc.desc     : OH_ImageReceiverNative_OffImageArrive return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OFFIMAGEARRIVE_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageReceiverNativeOffImageArrive();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OFFIMAGEARRIVE_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OFFIMAGEARRIVE_ERROR_0200
     * @tc.desc     : OH_ImageReceiverNative_OffImageArrive return IMAGE_RECEIVER_INVALID_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_OFFIMAGEARRIVE_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageReceiverNativeOffImageArriveInvaildParamter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_GETSIZE_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_GETSIZE_ERROR_0100
     * @tc.desc     : OH_ImageReceiverNative_GetSize return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_GETSIZE_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageReceiverNativeGetSize();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_GETCAPACITY_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_GETCAPACITY_ERROR_0100
     * @tc.desc     : OH_ImageReceiverNative_GetCapacity return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_GETCAPACITY_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageReceiverNativeGetCapacity();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_RELEASE_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_RELEASE_ERROR_0100
     * @tc.desc     : OH_ImageReceiverNative_Release return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_RELEASE_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageReceiverNativeRelease();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_RELEASE_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_RELEASE_ERROR_0200
     * @tc.desc     : OH_ImageReceiverNative_Release return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_RELEASE_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImageReceiverNativeReleaseBadParamter();
      expect(res).assertEqual(0);
      done();
    });

  })
}