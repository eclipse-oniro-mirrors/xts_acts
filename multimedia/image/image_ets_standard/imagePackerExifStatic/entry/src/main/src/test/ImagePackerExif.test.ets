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


import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, DEFAULT, Hypium, Level } from '../../../hypium/index';
import image from '@ohos.multimedia.image';
import fileIo from '@ohos.file.fs';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import resourceManager from '@ohos.resourceManager';
import common from '@ohos.app.ability.common';
import { PropertyKeys } from './PropertyKey.test'
import { initialize } from './AbilityContextHelper.test';

let filesDir: string | undefined | null;
let cacheDir: string | undefined | null;
let testContext: common.UIAbilityContext | undefined;

class picType {
  public name: string = ""
  public mimeType: string = ""
  public fileSuffix: string = ""
}

interface Result {
  pixelMap: image.PixelMap | undefined
  imageSource: image.ImageSource | undefined
}

let sleep = async (count:int) : Promise<int> => {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, count)
  });
};


export default function imagePackerExifTest() {

  describe('imagePackerExifTest', () => {

    let filePath: string;

    const picMimeType: Array<picType> = [
      {
        name: "test_exif_v2", mimeType: "image/jpeg", fileSuffix: "jpg"
      },
      {
        name: "test_exif_v2", mimeType: "image/webp", fileSuffix: "webp"
      },
      {
        name: "test_exif_v2", mimeType: "image/png", fileSuffix: "png"
      },
      {
        name: "test_exif_empty", mimeType: "image/jpeg", fileSuffix: "jpg"
      },
      {
        name: "test_exif_empty", mimeType: "image/webp", fileSuffix: "webp"
      },
      {
        name: "test_exif_empty", mimeType: "image/png", fileSuffix: "png"
      },
      {
        name: "test_exif_v3", mimeType: "image/jpeg", fileSuffix: "jpg"
      },
      {
        name: "test_exif_v3", mimeType: "image/webp", fileSuffix: "webp"
      },
      {
        name: "test_exif_v3", mimeType: "image/png", fileSuffix: "png"
      }
    ]

    beforeAll(async () => {
      await initialize();
      filesDir = Hypium.get('filesDir') as string | undefined | null;
      cacheDir = Hypium.get('cacheDir') as string | undefined | null;
      testContext = Hypium.get('context') as common.UIAbilityContext;
    })

    const getImageProperty = async (propertyKey: image.PropertyKey, imageSource: image.ImageSource) => {
      const options: image.ImagePropertyOptions = {
        index: 0, defaultValue: 'undefined'
      }
      return await imageSource.getImageProperty(propertyKey, options)
    }

    const propertyComp = async (tag: string, key: image.PropertyKey, newImageSource: image.ImageSource,
                                oldImageSource: image.ImageSource, fileName: string) => {
      let result: boolean = true
      const imagePropertyOld = await getImageProperty(key, oldImageSource)
      const imagePropertyNew = await getImageProperty(key, newImageSource)
      if (imagePropertyOld !== imagePropertyNew) {
        hilog.info(0x0000, tag, `propertyComp failed ${fileName} ${key} imagePropertyOld ${imagePropertyOld} imagePropertyNew: ${imagePropertyNew}`);
        result = false
      }
      return result
    }

    const propertyCompFalse = async (tag: string, key: image.PropertyKey, newImageSource: image.ImageSource,
                                     fileName: string) => {
      let result: boolean = true
      try {
        let data = await newImageSource.getImageProperty(key);
        hilog.info(0x0000, tag, `propertyCompFalse failed ${fileName} ${key} imagePropertyNew: ${data}`);
        result = false
      } catch(error) {
        error = error as BusinessError;
        if (error.code != 62980123) {
          result = false
          hilog.info(0x0000, tag, `propertyCompFalse failed ${fileName} ${key} errorCode: ${error.code} errorMessage: ${error.message}`);
        }
      }
      return result
    }

    const checkProperty = async (tag: string, newImageSource: image.ImageSource, oldImageSource: image.ImageSource,
                                 name: string, fileName: string, needsPackProperties?: boolean | undefined) => {
      let checkResult: boolean = true
      if (name === "test_exif_v2") {
        if (needsPackProperties) {
          for (let i = 0; i < PropertyKeys.length; i++) {
            const key = PropertyKeys[i]
            checkResult = await propertyComp(tag, key, newImageSource, oldImageSource, fileName)
            if (!checkResult) {
              return checkResult
            }
          }
          await oldImageSource.release();
          await newImageSource.release();
        } else {
          for (let i = 0; i < PropertyKeys.length; i++) {
            const key = PropertyKeys[i]
            checkResult = await propertyCompFalse(tag, key, newImageSource, fileName)
            if (!checkResult) {
              return checkResult
            }
          }
          await oldImageSource.release();
          await newImageSource.release();
        }
      } else if (name === "test_exif_v3") {
        if (needsPackProperties) {
          const key = image.PropertyKey.ORIENTATION
          checkResult = await propertyComp(tag, key, newImageSource, oldImageSource, fileName)
          await oldImageSource.release();
          await newImageSource.release();
          if (!checkResult) {
            return checkResult
          }
        } else {
          const key = image.PropertyKey.ORIENTATION
          checkResult = await propertyCompFalse(tag, key, newImageSource, fileName)
          await oldImageSource.release();
          await newImageSource.release();
          if (!checkResult) {
            return checkResult
          }
        }
      } else {
        for (let i = 0; i < PropertyKeys.length; i++) {
          const key = PropertyKeys[i]
          checkResult = await propertyCompFalse(tag, key, newImageSource, fileName)
          if (!checkResult) {
            return checkResult
          }
        }
        await oldImageSource.release();
        await newImageSource.release();
      }
      return checkResult
    }

    const getFdCacheDir = (tag: string, fileNameEnd: string) => {
      const uri: string = cacheDir + '/' + tag + `.${fileNameEnd}`;
      const file: fileIo.File = fs.openSync(uri, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      return file.fd as int
    }

    const getBuffer = (fileName: string) => {
      filePath = filesDir + '/' + fileName;
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead)
      return bufferRead
    }

    const getImageSource = async (fileName: string, type?: string) => {
      let imageSourceApi: image.ImageSource | undefined;
      if (type === "buffer") {
        const buffer = getBuffer(fileName)
        imageSourceApi = image.createImageSource(buffer)
      } else if (type === "uri") {
        const filePath = filesDir + '/' + fileName
        imageSourceApi = image.createImageSource(filePath)
      } else if (type === "rawfile") {
        const resourceMgr: resourceManager.ResourceManager = testContext!.resourceManager
        const rawFileDescriptor = await resourceMgr.getRawFd(fileName)
        imageSourceApi = image.createImageSource(rawFileDescriptor)
      } else if (type === "incremental") {
        const picBuffer = getBuffer(fileName)
        imageSourceApi = image.createIncrementalSource(picBuffer)
      } else {
        const filePath = filesDir + "/" + fileName;
        const file = fs.openSync(filePath)
        imageSourceApi = image.createImageSource(file.fd as int);
      }
      expect(imageSourceApi != undefined).assertTrue();
      return imageSourceApi!
    }

    const getPixelMap = async (fileName: string, type?: string) => {
      const imageSourceApi = await getImageSource(fileName, type)
      let opt: image.DecodingOptions = {
        editable: true,
      }
      const pixelMap = await imageSourceApi.createPixelMap(opt);
      const result: Result = {
        pixelMap: pixelMap, imageSource: imageSourceApi
      }
      return result
    }

    const checkPackImageSourcePixelMapPromise = async (packOptsFormat: string, name: string, fileNameEnd: string,
                                                       tag: string, caseType: string, packType: string,
                                                       needsPackProperties?: boolean | undefined, type?: string) => {
      const fileName = name + "." + fileNameEnd
      const imagePackerApi: image.ImagePacker = image.createImagePacker();
      let packOpts: image.PackingOption;
      if (needsPackProperties == true) {
        packOpts = {
          format: packOptsFormat, quality: 100, needsPackProperties: true
        };
      } else if (needsPackProperties == false) {
        packOpts = {
          format: packOptsFormat, quality: 100, needsPackProperties: false
        };
      } else {
        packOpts = {
          format: packOptsFormat, quality: 100
        };
      }
      let imageData: ArrayBuffer
      let oldImageSource: image.ImageSource
      let newImageSource: image.ImageSource | undefined
      if (caseType === "pixelMap") {
        const result = await getPixelMap(fileName, type)
        if (result.pixelMap == undefined) {
          return false
        }
        const pixelMap = result.pixelMap as image.PixelMap
        oldImageSource = result.imageSource as image.ImageSource
        const fdNum = getFdCacheDir(tag, fileNameEnd)
        await imagePackerApi.packToFile(pixelMap, fdNum, packOpts)
        newImageSource = image.createImageSource(fdNum);
      } else {
        const imageSourceApi = await getImageSource(fileName, type)
        if (imageSourceApi == undefined) {
          return false
        }
        oldImageSource = imageSourceApi
        const fdNum = getFdCacheDir(tag, fileNameEnd)
        await imagePackerApi.packToFile(imageSourceApi, fdNum, packOpts)
        newImageSource = image.createImageSource(fdNum);
      }
      if (newImageSource == undefined) {
        return false;
      }
      const result = await checkProperty(tag, newImageSource, oldImageSource, name, fileName, needsPackProperties)
      return result
    }


    const checkPack = async (tag: string, imageData: ArrayBuffer, name: string, fileName: string,
                             oldImageSource: image.ImageSource, fdNum: int, checkType: string, needsPackProperties?: boolean | undefined) => {
      let result = false
      let newImageSource: image.ImageSource | undefined
      if (checkType == "data") {
        newImageSource = image.createImageSource(imageData);
      } else {
        newImageSource = image.createImageSource(fdNum);
      }
      if (newImageSource == undefined) {
        return result;
      }
      try {
        result = await checkProperty(tag, newImageSource, oldImageSource, name, fileName, needsPackProperties)
      } catch (error) {
        result = false
      }
      return result
    }

    const packToFileCallback = async (
      imagePackerApi: image.ImagePacker,
      imageSourceApi: image.ImageSource | image.PixelMap,
      fdNum: int,
      packOpts: image.PackingOption
    ) => {
      return new Promise<void>((resolve, reject): void => {
        let callbackFunc = (err: BusinessError|null) => {
          if(err && err.code) {
            reject(err);
          } else {
            resolve(undefined);
          }
        }
        if (imageSourceApi instanceof image.ImageSource) {
          imagePackerApi.packToFile(imageSourceApi as image.ImageSource, fdNum, packOpts, callbackFunc);
        } else {
          imagePackerApi.packToFile(imageSourceApi as image.PixelMap, fdNum, packOpts, callbackFunc);
        }
    });
    }

    const checkPackImageSourcePixelMapCallBack = async (packOptsFormat: string, name: string, fileNameEnd: string,
                                                        tag: string, caseType: string, packType: string,
                                                        needsPackProperties?: boolean | undefined, type?: string) => {
      const fileName = name + "." + fileNameEnd;
      const imagePackerApi: image.ImagePacker = image.createImagePacker();
      let packOpts: image.PackingOption;
      if (needsPackProperties == true) {
        packOpts = {
          format: packOptsFormat, quality: 100, needsPackProperties: true
        };
      } else if (needsPackProperties == false) {
        packOpts = {
          format: packOptsFormat, quality: 100, needsPackProperties: false
        };
      } else {
        packOpts = {
          format: packOptsFormat, quality: 100
        };
      }
      let oldImageSource: image.ImageSource
      let cResult = false
      const fdNum = getFdCacheDir(tag, fileNameEnd)
      try {
        if (caseType === "pixelMap") {
          const result = await getPixelMap(fileName, type)
          if (result.pixelMap == undefined) {
            return false
          }
          const pixelMap = result.pixelMap as image.PixelMap
          oldImageSource = result.imageSource as image.ImageSource
          await packToFileCallback(imagePackerApi, pixelMap, fdNum, packOpts);
        } else {
          const imageSourceApi = await getImageSource(fileName, type)
          if (imageSourceApi == undefined) {
            return false
          }
          oldImageSource = imageSourceApi
          await packToFileCallback(imagePackerApi, imageSourceApi, fdNum, packOpts);
        }
      } catch (err) {
        hilog.info(0x0000, tag, `packToFileCallback failed: ${err}`);
        return false;
      }
      cResult = await checkPack(tag, new ArrayBuffer(0), name, fileName, oldImageSource, fdNum, "fd", needsPackProperties)
      return cResult
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_PROMISE_STATIC_0100
     * @tc.desc   packToFile -promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_PROMISE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_PROMISE_STATIC_0100"
      try {
        let compResult = true
        for (let i = 0; i < picMimeType.length; i++) {
          const name: string = picMimeType[i].name
          const mimeType: string = picMimeType[i].mimeType
          const fileSuffix: string = picMimeType[i].fileSuffix
          const result = await checkPackImageSourcePixelMapPromise(
            mimeType, name, fileSuffix, tag, "imageSource", "packToFile", true, "rawfile")
          compResult = compResult && result
        }
        expect(compResult).assertTrue()
        done()
      } catch (error) {
        hilog.info(0x0000, tag, `failed ${JSON.stringify(error)}`);
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_PROMISE_STATIC_0200
     * @tc.desc   packToFile -promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_PROMISE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_PROMISE_STATIC_0200"
      try {
        let compResult = true
        for (let i = 0; i < picMimeType.length; i++) {
          const name: string = picMimeType[i].name
          const mimeType: string = picMimeType[i].mimeType
          const fileSuffix: string = picMimeType[i].fileSuffix
          const result = await checkPackImageSourcePixelMapPromise(
            mimeType, name, fileSuffix, tag, "imageSource", "packToFile", false, "rawfile")
          compResult = compResult && result
        }
        expect(compResult).assertTrue()
        done()
      } catch (error) {
        hilog.info(0x0000, tag, `failed ${JSON.stringify(error)}`);
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_PROMISE_STATIC_0300
     * @tc.desc   packToFile -promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_PROMISE_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_PROMISE_STATIC_0300"
      try {
        let compResult = true
        for (let i = 0; i < picMimeType.length; i++) {
          const name: string = picMimeType[i].name
          const mimeType: string = picMimeType[i].mimeType
          const fileSuffix: string = picMimeType[i].fileSuffix
          const result = await checkPackImageSourcePixelMapPromise(
            mimeType, name, fileSuffix, tag, "imageSource", "packToFile")
          compResult = compResult && result
        }
        expect(compResult).assertTrue()
        done()
      } catch (error) {
        hilog.info(0x0000, tag, `failed ${JSON.stringify(error)}`);
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_PROMISE_STATIC_0100
     * @tc.desc   packToFile -promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_PROMISE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_PROMISE_STATIC_0100"
      try {
        let compResult = true
        for (let i = 0; i < picMimeType.length; i++) {
          const name: string = picMimeType[i].name
          const mimeType: string = picMimeType[i].mimeType
          const fileSuffix: string = picMimeType[i].fileSuffix
          //TODO type后续修改为incremental值,目前用该值会导致图片exif获取失败
          const result = await checkPackImageSourcePixelMapPromise(
            mimeType, name, fileSuffix, tag, "pixelMap", "packToFile", true)
          compResult = compResult && result
        }
        expect(compResult).assertTrue()
        done()
      } catch (error) {
        hilog.info(0x0000, tag, `failed ${JSON.stringify(error)}`);
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_PROMISE_STATIC_0200
     * @tc.desc   packToFile -promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_PROMISE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_PROMISE_STATIC_0200"
      try {
        let compResult = true
        for (let i = 0; i < picMimeType.length; i++) {
          const name: string = picMimeType[i].name
          const mimeType: string = picMimeType[i].mimeType
          const fileSuffix: string = picMimeType[i].fileSuffix
          //TODO type后续修改为incremental值,目前用该值会导致图片exif获取失败
          const result = await checkPackImageSourcePixelMapPromise(
            mimeType, name, fileSuffix, tag, "pixelMap", "packToFile", false)
          compResult = compResult && result
        }
        expect(compResult).assertTrue()
        done()
      } catch (error) {
        hilog.info(0x0000, tag, `failed ${JSON.stringify(error)}`);
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_PROMISE_STATIC_0300
     * @tc.desc   packToFile -promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_PROMISE_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_PROMISE_STATIC_0300"
      try {
        let compResult = true
        for (let i = 0; i < picMimeType.length; i++) {
          const name: string = picMimeType[i].name
          const mimeType: string = picMimeType[i].mimeType
          const fileSuffix: string = picMimeType[i].fileSuffix
          const result = await checkPackImageSourcePixelMapPromise(
            mimeType, name, fileSuffix, tag, "pixelMap", "packToFile")
          compResult = compResult && result
        }
        expect(compResult).assertTrue()
        done()
      } catch (error) {
        hilog.info(0x0000, tag, `failed ${JSON.stringify(error)}`);
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_CALLBACK_STATIC_0100
     * @tc.desc   packToFile -callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_CALLBACK_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_CALLBACK_STATIC_0100"
      try {
        let compResult = true
        for (let i = 0; i < picMimeType.length; i++) {
          const name: string = picMimeType[i].name
          const mimeType: string = picMimeType[i].mimeType
          const fileSuffix: string = picMimeType[i].fileSuffix
          const result = await checkPackImageSourcePixelMapCallBack(
            mimeType, name, fileSuffix, tag, "pixelMap", "packToFile", true, "rawfile")
          compResult = compResult && result
        }
        expect(compResult).assertTrue()
        done()
      } catch (error) {
        hilog.info(0x0000, tag, `failed ${JSON.stringify(error)}`);
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_CALLBACK_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_CALLBACK_STATIC_0200
     * @tc.desc   packToFile -callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_CALLBACK_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_CALLBACK_STATIC_0200"
      try {
        let compResult = true
        for (let i = 0; i < picMimeType.length; i++) {
          const name: string = picMimeType[i].name
          const mimeType: string = picMimeType[i].mimeType
          const fileSuffix: string = picMimeType[i].fileSuffix
          const result = await checkPackImageSourcePixelMapCallBack(
            mimeType, name, fileSuffix, tag, "pixelMap", "packToFile", false, "rawfile")
          compResult = compResult && result
        }
        expect(compResult).assertTrue()
        done()
      } catch (error) {
        hilog.info(0x0000, tag, `failed ${JSON.stringify(error)}`);
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_CALLBACK_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_CALLBACK_STATIC_0300
     * @tc.desc   packToFile -callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_CALLBACK_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_CALLBACK_STATIC_0300"
      try {
        let compResult = true
        for (let i = 0; i < picMimeType.length; i++) {
          const name: string = picMimeType[i].name
          const mimeType: string = picMimeType[i].mimeType
          const fileSuffix: string = picMimeType[i].fileSuffix
          const result = await checkPackImageSourcePixelMapCallBack(
            mimeType, name, fileSuffix, tag, "pixelMap", "packToFile")
          compResult = compResult && result
        }
        expect(compResult).assertTrue()
        done()
      } catch (error) {
        hilog.info(0x0000, tag, `failed ${JSON.stringify(error)}`);
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_CALLBACK_STATIC_0100
     * @tc.desc   packToFile -callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_CALLBACK_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const tag: string = 'SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_CALLBACK_STATIC_0100'
      try {
        let compResult = true
        for (let i = 0; i < picMimeType.length; i++) {
          const name: string = picMimeType[i].name
          const mimeType: string = picMimeType[i].mimeType
          const fileSuffix: string = picMimeType[i].fileSuffix
          const result = await checkPackImageSourcePixelMapCallBack(
            mimeType, name, fileSuffix, tag, "imageSource", "packToFile", true, "uri")
          compResult = compResult && result
        }
        expect(compResult).assertTrue()
        done()
      } catch (error) {
        hilog.info(0x0000, tag, `failed ${JSON.stringify(error)}`);
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_CALLBACK_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_CALLBACK_STATIC_0200
     * @tc.desc   packToFile -callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_CALLBACK_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const tag: string = 'SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_CALLBACK_STATIC_0200'
      try {
        let compResult = true
        for (let i = 0; i < picMimeType.length; i++) {
          const name: string = picMimeType[i].name
          const mimeType: string = picMimeType[i].mimeType
          const fileSuffix: string = picMimeType[i].fileSuffix
          const result = await checkPackImageSourcePixelMapCallBack(
            mimeType, name, fileSuffix, tag, "imageSource", "packToFile", false, "buffer")
          compResult = compResult && result
        }
        expect(compResult).assertTrue()
        done()
      } catch (error) {
        hilog.info(0x0000, tag, `failed ${JSON.stringify(error)}`);
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_CALLBACK_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_CALLBACK_STATIC_0300
     * @tc.desc   packToFile -callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_CALLBACK_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const tag: string = 'SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_CALLBACK_STATIC_0300'
      try {
        let compResult = true
        for (let i = 0; i < picMimeType.length; i++) {
          const name: string = picMimeType[i].name
          const mimeType: string = picMimeType[i].mimeType
          const fileSuffix: string = picMimeType[i].fileSuffix
          const result = await checkPackImageSourcePixelMapCallBack(
            mimeType, name, fileSuffix, tag, "imageSource", "packToFile")
          compResult = compResult && result
        }
        expect(compResult).assertTrue()
        done()
      } catch (error) {
        hilog.info(0x0000, tag, `failed ${JSON.stringify(error)}`);
        expect().assertFail()
        done()
      }
    })
  })
}

