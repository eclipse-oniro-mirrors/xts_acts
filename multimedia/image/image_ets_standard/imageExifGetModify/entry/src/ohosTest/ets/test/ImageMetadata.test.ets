/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, it, expect, afterEach, Level } from '@ohos/hypium';
import image from '@ohos.multimedia.image';
import { BusinessError } from '@ohos.base';
import fs from '@ohos.file.fs';
import json from '@ohos.util.json';
import resourceManager from '@ohos.resourceManager';
import common from '@ohos.app.ability.common';

let domain: number = 0x0000;

export default function ImageMetadata() {

  describe('ImageMetadata', () => {
    let filePath: string;
    let fdNumber: number
    
    let testContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;

    const getFd = async (fileName: string) => {
      filePath = AppStorage.get('pathDir') + "/" + fileName;
      const file = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fdNumber = file.fd
    }

    const getBuffer = async (fileName: string) => {
      filePath = AppStorage.get('pathDir') + '/' + fileName;
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead)
      return bufferRead
    }

    //创建imageSource对象并返回
    //type:创建imageSource的方式，取值: uri、fd、buffer,rawfile,incremental 默认fd
    //fileName: 文件名,例: test_exif_v2.jpg
    const getImageSource = async(fileName:string, type:string)=>{
      let imageSourceApi:image.ImageSource
      if(type === "buffer"){
        const buffer = await getBuffer(fileName)
        imageSourceApi = image.createImageSource(buffer)
      }else if(type === "uri"){
        const filePath = AppStorage.get('pathDir') + '/' + fileName
        imageSourceApi = image.createImageSource(filePath)
      }else if(type === "rawfile"){
        const resourceMgr: resourceManager.ResourceManager = testContext.createModuleContext("entry_test").resourceManager
        const rawFileDescriptor = await resourceMgr.getRawFd(fileName)
        imageSourceApi = image.createImageSource(rawFileDescriptor)
      }else if(type === "incremental") {
        const picBuffer = await getBuffer(fileName)
        imageSourceApi = image.CreateIncrementalSource(picBuffer)
      }else{
        await getFd(fileName);
        imageSourceApi = image.createImageSource(fdNumber);
        fs.closeSync(fdNumber) // getFd open fd，创建ImageSource后，close fd。
      }
      return imageSourceApi
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_READ_IMAGE_METADATA_BY_TYPE_0001
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_READ_IMAGE_METADATA_BY_TYPE_0001
     * @tc.desc   readImageMetadataByType returns PNG metadata fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_READ_IMAGE_METADATA_BY_TYPE_0001', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_SOURCE_READ_IMAGE_METADATA_BY_TYPE_0001'
      hilog.info(domain, testTag, `begin`);
      try {
        const fileName = 'test_reladeMetadata.png';
        const imageSourceApi: image.ImageSource = await getImageSource(fileName, "uri");
        let metadataTypes: image.MetadataType[] = [image.MetadataType.PNG_METADATA];
        let imageMetadata: image.ImageMetadata = await imageSourceApi.readImageMetadataByType(metadataTypes);
        imageSourceApi.release();
        expect(imageMetadata != null).assertTrue();
        expect(imageMetadata.pngMetadata != null).assertTrue();
        hilog.info(domain, testTag, `readImageMetadataByType success `);
        done();
      } catch (e) {
        hilog.info(domain, testTag, `readImageMetadataByType error ` + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_READ_IMAGE_METADATA_BY_TYPE_0002
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_READ_IMAGE_METADATA_BY_TYPE_0002
     * @tc.desc   readImageMetadataByType returns JFIF metadata fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_READ_IMAGE_METADATA_BY_TYPE_0002', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_SOURCE_READ_IMAGE_METADATA_BY_TYPE_0002'
      hilog.info(domain, testTag, `begin`);
      try {
        const fileName = 'sample2.jfif';
        const imageSourceApi: image.ImageSource = await getImageSource(fileName, "uri");
        let metadataTypes: image.MetadataType[] = [image.MetadataType.JFIF_METADATA];
        let imageMetadata: image.ImageMetadata = await imageSourceApi.readImageMetadataByType(metadataTypes);
        imageSourceApi.release();
        expect(imageMetadata != null).assertTrue();
        expect(imageMetadata.jfifMetadata != null).assertTrue();
        hilog.info(domain, testTag, `readImageMetadataByType success `);
        done();
      } catch (e) {
        hilog.info(domain, testTag, `readImageMetadataByType error ` + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_READ_IMAGE_METADATA_BY_TYPE_0003
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_READ_IMAGE_METADATA_BY_TYPE_0003
     * @tc.desc   readImageMetadataByType returns TIFF metadata fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_READ_IMAGE_METADATA_BY_TYPE_0003', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_SOURCE_READ_IMAGE_METADATA_BY_TYPE_0003'
      hilog.info(domain, testTag, `begin`);
      try {
        const fileName = 'tiff_xmp.tiff';
        const imageSourceApi: image.ImageSource = await getImageSource(fileName, "uri");
        let metadataTypes: image.MetadataType[] = [image.MetadataType.TIFF_METADATA];
        let imageMetadata: image.ImageMetadata = await imageSourceApi.readImageMetadataByType(metadataTypes);
        imageSourceApi.release();
        expect(imageMetadata != null).assertTrue();
        expect(imageMetadata.tiffMetadata != null).assertTrue();
        hilog.info(domain, testTag, `readImageMetadataByType success `);
        done();
      } catch (e) {
        hilog.info(domain, testTag, `readImageMetadataByType error ` + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_READ_IMAGE_METADATA_BY_TYPE_0004
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_READ_IMAGE_METADATA_BY_TYPE_0004
     * @tc.desc   readImageMetadataByType returns HEICS metadata fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_READ_IMAGE_METADATA_BY_TYPE_0004', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_SOURCE_READ_IMAGE_METADATA_BY_TYPE_0004'
      let result: boolean = true;
      let isSupportHEIFDecode: boolean = image.createImageSource(AppStorage.get('pathDir') + '/' + "test.jpg").supportedFormats.includes("image/heic");
      if (!isSupportHEIFDecode) {
        console.info(`${testTag} device is not support decode heif!`);
        expect(result).assertTrue();
        done();
        return;
      } 
      hilog.info(domain, testTag, `begin`);
      try {
        const fileName = 'C027.heic';
        const imageSourceApi: image.ImageSource = await getImageSource(fileName, "uri");
        let metadataTypes: image.MetadataType[] = [image.MetadataType.HEIFS_METADATA];
        let imageMetadata: image.ImageMetadata = await imageSourceApi.readImageMetadataByType(metadataTypes);
        imageSourceApi.release();
        expect(imageMetadata != null).assertTrue();
        expect(imageMetadata.heifsMetadata != null).assertTrue();
        hilog.info(domain, testTag, `readImageMetadataByType success `);
        done();
      } catch (e) {
        hilog.info(domain, testTag, `readImageMetadataByType error ` + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_READ_IMAGE_METADATA_BY_TYPE_0005
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_READ_IMAGE_METADATA_BY_TYPE_0005
     * @tc.desc   readImageMetadataByType returns GIF metadata fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_READ_IMAGE_METADATA_BY_TYPE_0005', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_SOURCE_READ_IMAGE_METADATA_BY_TYPE_0005'
      hilog.info(domain, testTag, `begin`);
      try {
        const fileName = 'test6.gif';
        const imageSourceApi: image.ImageSource = await getImageSource(fileName, "uri");
        let metadataTypes: image.MetadataType[] = [image.MetadataType.GIF_METADATA];
        let imageMetadata: image.ImageMetadata = await imageSourceApi.readImageMetadataByType(metadataTypes);
        imageSourceApi.release();
        expect(imageMetadata != null).assertTrue();
        expect(imageMetadata.gifMetadata != null).assertTrue();
        hilog.info(domain, testTag, `readImageMetadataByType success `);
        done();
      } catch (e) {
        hilog.info(domain, testTag, `readImageMetadataByType error ` + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_READ_IMAGE_METADATA_BY_TYPE_0006
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_READ_IMAGE_METADATA_BY_TYPE_0006
     * @tc.desc   readImageMetadataByType returns AVIS metadata fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_READ_IMAGE_METADATA_BY_TYPE_0006', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_SOURCE_READ_IMAGE_METADATA_BY_TYPE_0006'
      hilog.info(domain, testTag, `begin`);
      try {
        const fileName = 'bird_8bit_I420_599x359_fps10.avif';
        const imageSourceApi: image.ImageSource = await getImageSource(fileName, "uri");
        let metadataTypes: image.MetadataType[] = [image.MetadataType.AVIS_METADATA];
        let imageMetadata: image.ImageMetadata = await imageSourceApi.readImageMetadataByType(metadataTypes);
        imageSourceApi.release();
        expect(imageMetadata != null).assertTrue();
        expect(imageMetadata.avisMetadata != null).assertTrue();
        hilog.info(domain, testTag, `readImageMetadataByType success `);
        done();
      } catch (e) {
        hilog.info(domain, testTag, `readImageMetadataByType error ` + e);
        expect().assertFail();
        done();
      }
    });

  })
}