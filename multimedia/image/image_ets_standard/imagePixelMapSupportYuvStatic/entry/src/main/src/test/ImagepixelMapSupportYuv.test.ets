/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, DEFAULT, Hypium, Level } from '../../../hypium/index';
import image from '@ohos.multimedia.image';
import hilog from '@ohos.hilog';
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';
import rpc from '@ohos.rpc';
import {BusinessError} from '@ohos.base';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import resourceManager from '@ohos.resourceManager';
import fileIo from '@ohos.file.fs';
import { initialize } from './AbilityContextHelper.test';

let testContext: common.UIAbilityContext | undefined;
let sleep = (delay: int): Promise<void> => {
  return new Promise<void>((resolve, _) => {
    setTimeout(() => {
      resolve(undefined);
    }, delay);
  });
};

export default function imagepixelMapSupportYuv() {
  describe('pixelMapSupportYuvAbilityTest',  (): void => {

    let filePath: string;
    let fdInt: int;

    beforeAll(() => {
      await initialize();
      testContext = Hypium.get('context') as common.UIAbilityContext;
    })

    const getFd = async (fileName: string):Promise<void> => {
      filePath = Hypium.get('filesDir') + "/" + fileName;
      hilog.info(0x0000, '${testNum}', '%{public}s', `fileName: ${fileName}, filePath: ${filePath}`)
      const file = fs.openSync(filePath)
      fdInt = file.fd as int
    }

    const getBuffer = async (fileName: string): Promise<ArrayBuffer> => {
      filePath = Hypium.get('filesDir') + '/' + fileName;
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead)
      return bufferRead
    }

    //创建imageSource对象并返回
    //type:创建imageSource的方式，取值: uri、fd、buffer,rawfile,incremental 默认fd
    //fileName: 文件名,例: yuv_test_oto.jpeg
    const getImageSource = async (
      fileName:string,
      type:string
    ): Promise<image.ImageSource | undefined> => {
      let imageSourceApi:image.ImageSource | undefined
      if(type === "buffer") {
        const buffer = await getBuffer(fileName)
        imageSourceApi = image.createImageSource(buffer)
      } else if(type === "uri"){
        const filePath = Hypium.get('filesDir') + '/' + fileName
        imageSourceApi = image.createImageSource(filePath)
      } else{
        await getFd(fileName)
        imageSourceApi = image.createImageSource(fdInt);
      }
      return imageSourceApi
    }

    //创建pixelMap对象并返回
    //imageSourceType:创建imageSource的方式，取值: uri、fd、buffer,rawfile,incremental 默认fd
    //editable: 解码参数 editable
    let getPixMap_NV12 = async (
      fileName:string,
      imageSourceType:string,
      editable:boolean
    ): Promise<image.PixelMap | undefined> => {
      let imageSourceApi = await getImageSource(fileName, imageSourceType);
      if (imageSourceApi == undefined) {
        hilog.info(0x0000, '%{public}s', '%{public}s', `fileName: ${fileName}, createImageSource failed, imageSourceType: ${imageSourceType}`);
        return undefined;
      }
      let decodingOptions: image.DecodingOptions = {
        editable: editable,
        desiredPixelFormat: image.PixelMapFormat.NV12,
      };
      let pixelMap_NV12 = await imageSourceApi.createPixelMap(decodingOptions);
      return pixelMap_NV12
    }

    let getPixMap_NV21 = async (
      fileName:string,
      imageSourceType:string,
      editable:boolean
    ): Promise<image.PixelMap | undefined> => {
      let imageSourceApi = await getImageSource(fileName, imageSourceType);
      if (imageSourceApi == undefined) {
        hilog.info(0x0000, '%{public}s', '%{public}s', `fileName: ${fileName}, createImageSource failed, imageSourceType: ${imageSourceType}`);
        return undefined;
      }
      let decodingOptions: image.DecodingOptions = {
        editable: editable,
        desiredPixelFormat: image.PixelMapFormat.NV21,
      };
      let pixelMap_NV21 = await imageSourceApi.createPixelMap(decodingOptions);
      return pixelMap_NV21
    }

    //检查 ArrayBuffer 中的内容是否包含 0
    const checkArrayBuffer =  (arrayBuffer:ArrayBuffer) =>{
      const bufferArr = new Uint8Array(arrayBuffer)
      let res = true
      for (let i = 0; i < bufferArr.length; i++) {
        if(bufferArr[i] == 0){
          res = false
        }
      }
      return res
    }

    //测试 pixelMap writeBufferToPixels，调用接口写入不含0的buffer，写入成功后读取，读取到的buffer不含0则用例成功返回True
    //pixelMap: 需要测试的pixelMap
    //testNum 用例编号
    //type:接口调用方式，包含 promise、callback、sync，默认为sync
    //writeBuffer/readBuffer 36 = 24(Y:4(height) * 6(width)) + 12(UV:24 * 0.5)
    const testWriteBufferToPixels = async (
      testNum:string,
      pixelMap:image.PixelMap,
      type:string
    ): Promise<boolean> =>{
      let region: image.Region = { x: 0, y: 0, size: { height: 4, width: 6 } };
      await pixelMap.crop(region)
      const writeBuffer: ArrayBuffer = new ArrayBuffer(36);
      let bufferArr: Uint8Array = new Uint8Array(writeBuffer);
      for (let i = 0; i < bufferArr.length; i++) {
        bufferArr[i] = i + 1;
      }
      let readBuffer = new ArrayBuffer(36)
      let result = false
      if(type == "promise"){
        await pixelMap.writeBufferToPixels(writeBuffer)
        await pixelMap.readPixelsToBuffer(readBuffer)
        result = checkArrayBuffer(readBuffer)
      }else if(type == "callback"){
        pixelMap.writeBufferToPixels(writeBuffer, (error: BusinessError|null) => {
          if (error && error.code) {
            hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}:Failed to write data from a buffer to a PixelMap  ${error}`)
            result = false
          } else {
          try {
            await pixelMap.readPixelsToBuffer(readBuffer)
            result = checkArrayBuffer(readBuffer)
          } catch(error) {
            hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}:Failed to read image pixel data  ${error}`)
            result = false
          }
        }
        });
        await sleep(1000)
      }else {
        pixelMap.writeBufferToPixelsSync(writeBuffer)
        pixelMap.readPixelsToBufferSync(readBuffer)
        result = checkArrayBuffer(readBuffer)
      }
      return result
    }


    //测试pixelMap接口applyColorSpace,根据输入的目标色彩空间targetColorSpace对图像像素颜色进行色彩空间转换，成功时用例通过
    //testNum 用例编号
    //pixelMap: 需要测试的pixelMap对象
    //type: 接口的调用类型，包含promise、callback
    //targetColorSpace: 目标色彩空间
    let testPixelMapApplyColorSpace = async (
      done: () => void,
      testNum: string,
      pixelMap: image.PixelMap,
      type: string,
      targetColorSpace:colorSpaceManager.ColorSpaceManager
    ) => {
      if (type == 'promise') {
        await pixelMap.applyColorSpace(targetColorSpace)
        const csm = pixelMap.getColorSpace()
        expect(targetColorSpace.getColorSpaceName() === csm.getColorSpaceName()).assertTrue();
        done();
      }
      if (type == 'callback') {
        pixelMap.applyColorSpace(targetColorSpace, (error:BusinessError|null):void => {
          if (error && error.code) {
            hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}:${error}`);
            expect(false).assertTrue();
            done();
          } else {
            hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}:Succeeded`);
            const csm = pixelMap.getColorSpace()
            expect(targetColorSpace.getColorSpaceName() === csm.getColorSpaceName()).assertTrue();
            done();
          }
        })
      }
    }

    //测试pixelMap打包
    //testNum 用例编号
    //pixelMap: 需要测试的pixelMap对象
    //type: 接口的调用类型，包含promise、callback
    //testInterface: 打包调用的接口 packing/packToFile
    //format: 目标格式，例："image/jpeg"、"image/webp" 和 "image/png"。 当前YUV打包格式为 image/jpeg,
    //quality：打包参数，设定输出图片质量的参数，取值范围为0-100
    let pixelMapPacker = async(testNum: string, pixelMap: image.PixelMap, testInterface:string,
      type: string, format: string, quality: int): Promise<boolean> => {
      const imagePackerApi : image.ImagePacker = image.createImagePacker();
      let packOpts: image.PackingOption = { format: format, quality: quality }
      let checkResult = false
      if(testInterface === "packing"){
        try {
          await imagePackerApi.packToData(pixelMap, packOpts);
          checkResult = true
        } catch(error) {
          hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}:${JSON.stringify(error)}`);
          checkResult = false
        }
        let data: ArrayBuffer = await imagePackerApi.packToData(pixelMap, packOpts);
      }else {
        const uri: string = testContext!.cacheDir + "/" + `${testNum}` + "jpg"
        const file: fileIo.File = fs.openSync(uri, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        if(type === "promise"){
          try {
            await imagePackerApi.packToFile(pixelMap, file.fd as int, packOpts);
            checkResult = true
          } catch (error) {
            hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}:${JSON.stringify(error)}`);
            checkResult = false
          }
        }else{
          imagePackerApi.packToFile(pixelMap, file.fd as int, packOpts, (err: BusinessError|null) => {
            if (err && err.code) {
              hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}:${JSON.stringify(err)}`);
              checkResult = false
            } else {
              checkResult = true
            }
          })
          await sleep(1000)
        }
      }
      return checkResult
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_NV12_PACKING_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_NV12_PACKING_STATIC_0100
     * @tc.desc   packing -promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_PACKING_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_PACKING_STATIC_0100"
      try{
        let pixelMap_NV12 = await getPixMap_NV12("yuv_test_oto.jpeg", "buffer", true);
        if (pixelMap_NV12 == undefined) {
          expect().assertFail();
          done();
          return undefined;
        }
        const checkResult = await pixelMapPacker(testTag, pixelMap_NV12, "packing", 'promise', 'image/webp', 100)
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_NV12_PACKING_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_NV12_PACKING_STATIC_0200
     * @tc.desc   packing -callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_PACKING_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_PACKING_STATIC_0200"
      try{
        let pixelMap_NV12 = await getPixMap_NV12("yuv_test_eto.jpg", "rawfile",  true);
        if (pixelMap_NV12 == undefined) {
          expect().assertFail();
          done();
          return undefined;
        }
        const checkResult = await pixelMapPacker(testTag, pixelMap_NV12, "packing", 'callback', 'image/jpeg', 0);
        expect(checkResult).assertTrue();
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_NV12_PACKTOFILE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_NV12_PACKTOFILE_STATIC_0100
     * @tc.desc   packToFile -promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_PACKTOFILE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag ="SUB_MULTIMEDIA_IMAGE_NV12_PACKTOFILE_STATIC_0100"
      try{
        let pixelMap_NV12 = await getPixMap_NV12("yuv_test_ote.jpg", "uri", true);
        if (pixelMap_NV12 == undefined) {
          expect().assertFail();
          done();
          return undefined;
        }
        const checkResult =  await pixelMapPacker(testTag, pixelMap_NV12, "packToFile", 'promise', 'image/jpeg', 98);
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_NV12_PACKTOFILE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_NV12_PACKTOFILE_STATIC_0200
     * @tc.desc   packToFile  -callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_PACKTOFILE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag ="SUB_MULTIMEDIA_IMAGE_NV12_PACKTOFILE_STATIC_0200"
      try{
        let pixelMap_NV12 = await getPixMap_NV12("yuv_test_oto.jpeg", "fd", true);
        if (pixelMap_NV12 == undefined) {
          expect().assertFail();
          done();
          return undefined;
        }
        const checkResult = await pixelMapPacker(testTag, pixelMap_NV12, "packToFile", 'callback', 'image/png', 98);
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_NV21_PACKING_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_NV21_PACKING_STATIC_0100
     * @tc.desc   packing -promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_PACKING_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag ="SUB_MULTIMEDIA_IMAGE_NV21_PACKING_STATIC_0100"
      try{
        let pixelMap_NV21 = await getPixMap_NV21("yuv_test_ote.jpg", "fd", true);
        if (pixelMap_NV21 == undefined) {
          expect().assertFail();
          done();
          return undefined;
        }
        const checkResult = await pixelMapPacker(testTag, pixelMap_NV21, "packing", 'promise', 'image/png', 22);
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_NV21_PACKING_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_NV21_PACKING_STATIC_0200
     * @tc.desc   packing -callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_PACKING_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag ="SUB_MULTIMEDIA_IMAGE_NV21_PACKING_STATIC_0200"
      try{
        let pixelMap_NV21 = await getPixMap_NV21("yuv_test_oto.jpeg", "fd", true);
        if (pixelMap_NV21 == undefined) {
          expect().assertFail();
          done();
          return undefined;
        }
        const checkResult = await pixelMapPacker(testTag, pixelMap_NV21, "packing", 'callback', 'image/jpeg', 98);
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_NV21_PACKTOFILE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_NV21_PACKTOFILE_STATIC_0100
     * @tc.desc   packing -promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_PACKTOFILE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag ="SUB_MULTIMEDIA_IMAGE_NV21_PACKTOFILE_STATIC_0100"
      try{
        let pixelMap_NV21 = await getPixMap_NV21("yuv_test_ote.jpg", "fd", true);
        if (pixelMap_NV21 == undefined) {
          expect().assertFail();
          done();
          return undefined;
        }
        const checkResult =  await pixelMapPacker(testTag, pixelMap_NV21, "packToFile", 'promise', 'image/jpeg', 98);
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_NV21_PACKTOFILE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_NV21_PACKTOFILE_STATIC_0200
     * @tc.desc   packing -callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_PACKTOFILE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag ="SUB_MULTIMEDIA_IMAGE_NV21_PACKTOFILE_STATIC_0200"
      try{
        let pixelMap_NV21 = await getPixMap_NV21("yuv_test_oto.jpeg", "fd", true);
        if (pixelMap_NV21 == undefined) {
          expect().assertFail();
          done();
          return undefined;
        }
        const checkResult = await pixelMapPacker(testTag, pixelMap_NV21, "packToFile", 'callback', 'image/webp', 100);
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_NV12_APPLYCOLORSPACE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_NV12_APPLYCOLORSPACE_STATIC_0100
     * @tc.desc   applyColorSpace -promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_APPLYCOLORSPACE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_APPLYCOLORSPACE_STATIC_0100"
      try{
        let pixelMap_NV12 = await getPixMap_NV12("yuv_test_oto.jpeg", "fd", true);
        if (pixelMap_NV12 == undefined) {
          expect().assertFail();
          done();
          return undefined;
        }
        let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
        let targetColorSpace : colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
        await testPixelMapApplyColorSpace(done, testTag, pixelMap_NV12, 'promise',  targetColorSpace)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_NV12_APPLYCOLORSPACE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_NV12_APPLYCOLORSPACE_STATIC_0200
     * @tc.desc   applyColorSpace -callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_APPLYCOLORSPACE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_APPLYCOLORSPACE_STATIC_0200"
      try{
        let pixelMap_NV12 = await getPixMap_NV12("yuv_test_oto.jpeg", "fd", true);
        if (pixelMap_NV12 == undefined) {
          expect().assertFail();
          done();
          return undefined;
        }
        let colorSpaceName = colorSpaceManager.ColorSpace.DCI_P3;
        let targetColorSpace : colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
        await testPixelMapApplyColorSpace(done, testTag, pixelMap_NV12, 'callback',  targetColorSpace)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_NV12_APPLYCOLORSPACE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_NV12_APPLYCOLORSPACE_STATIC_0300
     * @tc.desc   applyColorSpace -promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_APPLYCOLORSPACE_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_APPLYCOLORSPACE_STATIC_0300"
      try{
        let pixelMap_NV12 = await getPixMap_NV12("yuv_test_eto.jpg","fd", true);
        if (pixelMap_NV12 == undefined) {
          expect().assertFail();
          done();
          return undefined;
        }
        let colorSpaceName = colorSpaceManager.ColorSpace.DISPLAY_P3;
        let targetColorSpace : colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
        await testPixelMapApplyColorSpace(done, testTag, pixelMap_NV12, 'promise', targetColorSpace)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_NV12_APPLYCOLORSPACE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_NV12_APPLYCOLORSPACE_STATIC_0400
     * @tc.desc   applyColorSpace -callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_APPLYCOLORSPACE_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_APPLYCOLORSPACE_STATIC_0400"
      try{
        let pixelMap_NV12 = await getPixMap_NV12("yuv_test_oto.jpeg","fd", true);
        if (pixelMap_NV12 == undefined) {
          expect().assertFail();
          done();
          return undefined;
        }
        let colorSpaceName = colorSpaceManager.ColorSpace.ADOBE_RGB_1998;
        let targetColorSpace : colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
        await testPixelMapApplyColorSpace(done, testTag, pixelMap_NV12, 'callback', targetColorSpace)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_NV12_WRITEBUFFERTOPIXELS_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_NV12_WRITEBUFFERTOPIXELS_STATIC_0100
     * @tc.desc   writeBufferToPixels -promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_WRITEBUFFERTOPIXELS_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_WRITEBUFFERTOPIXELS_STATIC_0100"
      try{
        let pixelMap_NV12 = await getPixMap_NV12("yuv_test_ete.jpg", "fd", true);
        if (pixelMap_NV12 == undefined) {
          expect().assertFail();
          done();
          return undefined;
        }
        const result = await testWriteBufferToPixels(testTag, pixelMap_NV12, 'promise')
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_NV12_WRITEBUFFERTOPIXELS_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_NV12_WRITEBUFFERTOPIXELS_STATIC_0200
     * @tc.desc   writeBufferToPixels -callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_WRITEBUFFERTOPIXELS_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_WRITEBUFFERTOPIXELS_STATIC_0200"
      try{
        let pixelMap_NV12 = await getPixMap_NV12("yuv_test_oto.jpeg","uri", true);
        if (pixelMap_NV12 == undefined) {
          expect().assertFail();
          done();
          return undefined;
        }
        const result = await testWriteBufferToPixels(testTag, pixelMap_NV12, 'callback')
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_NV12_WRITEBUFFERTOPIXELS_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_NV12_WRITEBUFFERTOPIXELS_STATIC_0300
     * @tc.desc   writeBufferToPixelsSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_WRITEBUFFERTOPIXELS_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_WRITEBUFFERTOPIXELS_STATIC_0300"
      try{
        let pixelMap_NV12 = await getPixMap_NV12("yuv_test_ote.jpg", "fd", true);
        if (pixelMap_NV12 == undefined) {
          expect().assertFail();
          done();
          return undefined;
        }
        const result = await testWriteBufferToPixels(testTag, pixelMap_NV12, 'sync')
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_NV21_APPLYCOLORSPACE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_NV21_APPLYCOLORSPACE_STATIC_0100
     * @tc.desc   applyColorSpace -promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_APPLYCOLORSPACE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_APPLYCOLORSPACE_STATIC_0100"
      try{
        let pixelMap_NV21 = await getPixMap_NV21("yuv_test_ete.jpg", "buffer", true);
        if (pixelMap_NV21 == undefined) {
          expect().assertFail();
          done();
          return undefined;
        }
        let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
        let targetColorSpace : colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
        await testPixelMapApplyColorSpace(done, testTag, pixelMap_NV21, 'promise', targetColorSpace);
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_NV21_APPLYCOLORSPACE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_NV21_APPLYCOLORSPACE_STATIC_0200
     * @tc.desc   applyColorSpace -callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_APPLYCOLORSPACE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_APPLYCOLORSPACE_STATIC_0200"
      try{
        let pixelMap_NV21 = await getPixMap_NV21("yuv_test_ote.jpg", "fd", true);
        if (pixelMap_NV21 == undefined) {
          expect().assertFail();
          done();
          return undefined;
        }
        let colorSpaceName = colorSpaceManager.ColorSpace.DCI_P3;
        let targetColorSpace : colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
        await testPixelMapApplyColorSpace(done, testTag, pixelMap_NV21, 'callback', targetColorSpace);
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_NV21_APPLYCOLORSPACE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_NV21_APPLYCOLORSPACE_STATIC_0300
     * @tc.desc   applyColorSpace -promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_APPLYCOLORSPACE_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_APPLYCOLORSPACE_STATIC_0300"
      try{
        let pixelMap_NV21 = await getPixMap_NV21("yuv_test_eto.jpg","fd", true);
        if (pixelMap_NV21 == undefined) {
          expect().assertFail();
          done();
          return undefined;
        }
        let colorSpaceName = colorSpaceManager.ColorSpace.DISPLAY_P3;
        let targetColorSpace : colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
        await testPixelMapApplyColorSpace(done, testTag, pixelMap_NV21, 'promise', targetColorSpace);
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_NV21_APPLYCOLORSPACE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_NV21_APPLYCOLORSPACE_STATIC_0400
     * @tc.desc   applyColorSpace -callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_APPLYCOLORSPACE_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_APPLYCOLORSPACE_STATIC_0400"
      try{
        let pixelMap_NV21 = await getPixMap_NV21("yuv_test_ote.jpg","fd", true);
        if (pixelMap_NV21 == undefined) {
          expect().assertFail();
          done();
          return undefined;
        }
        let colorSpaceName = colorSpaceManager.ColorSpace.ADOBE_RGB_1998;
        let targetColorSpace : colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
        await testPixelMapApplyColorSpace(done, testTag, pixelMap_NV21, 'callback', targetColorSpace);
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_NV21_WRITEBUFFERTOPIXELS_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_NV21_WRITEBUFFERTOPIXELS_STATIC_0100
     * @tc.desc   writeBufferToPixels -promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_WRITEBUFFERTOPIXELS_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_WRITEBUFFERTOPIXELS_STATIC_0100"
      try{
        let pixelMap_NV21 = await getPixMap_NV21("yuv_test_ete.jpg", "fd", true);
        if (pixelMap_NV21 == undefined) {
          expect().assertFail();
          done();
          return undefined;
        }
        const result = await testWriteBufferToPixels(testTag, pixelMap_NV21, 'promise')
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_NV21_WRITEBUFFERTOPIXELS_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_NV21_WRITEBUFFERTOPIXELS_STATIC_0200
     * @tc.desc   writeBufferToPixels -callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_WRITEBUFFERTOPIXELS_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_WRITEBUFFERTOPIXELS_STATIC_0200"
      try{
        let pixelMap_NV21 = await getPixMap_NV21("yuv_test_oto.jpeg","uri", true);
        if (pixelMap_NV21 == undefined) {
          expect().assertFail();
          done();
          return undefined;
        }
        const result = await testWriteBufferToPixels(testTag, pixelMap_NV21, 'callback')
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_NV21_WRITEBUFFERTOPIXELS_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_NV21_WRITEBUFFERTOPIXELS_STATIC_0300
     * @tc.desc   writeBufferToPixelsSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_WRITEBUFFERTOPIXELS_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_WRITEBUFFERTOPIXELS_STATIC_0300"
      try{
        let pixelMap_NV12 = await getPixMap_NV12("yuv_test_ote.jpg", "fd", true);
        if (pixelMap_NV12 == undefined) {
          expect().assertFail();
          done();
          return undefined;
        }
        const result = await testWriteBufferToPixels(testTag, pixelMap_NV12, 'sync')
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })
  })
}


