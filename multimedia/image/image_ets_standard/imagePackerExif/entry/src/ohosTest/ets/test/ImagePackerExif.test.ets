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


import hilog from '@ohos.hilog';
import { describe, it, expect, beforeAll } from '@ohos/hypium'
import image from '@ohos.multimedia.image';
import fileIo from '@ohos.file.fs';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import resourceManager from '@ohos.resourceManager';
import common from '@ohos.app.ability.common';
import PropertyKey from './PropertyKey'

let filesDir: string | undefined;
let cacheDir: string | undefined;
let testContext: common.UIAbilityContext;


class picType {
  public name: string = ""
  public mimeType: string = ""
  public fileSuffix: string = ""
}

interface Result {
  pixelMap: image.PixelMap
  imageSource: image.ImageSource
}

let sleep = async (delay: number): Promise<void> => {
  return new Promise((resolve, _) => {
    setTimeout(async () => {
      resolve();
    }, delay);
  });
};


export default function imagePackerExifTest() {

  describe('ActsImagePackerExifTest', () => {

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
      filesDir = AppStorage.get('pathDir')
      cacheDir = AppStorage.get('cacheDir')
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
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
      await newImageSource.getImageProperty(key).then((data) => {
        hilog.info(0x0000, tag, `propertyCompFalse failed ${fileName} ${key} imagePropertyNew: ${data}`);
        result = false
      }).catch((error: BusinessError) => {
        if (error.code != 62980123) {
          result = false
          hilog.info(0x0000, tag, `propertyCompFalse failed ${fileName} ${key} errorCode: ${error.code} errorMessage: ${error.message}`);
        }
      })
      return result
    }

    const checkProperty = async (tag: string, newImageSource: image.ImageSource, oldImageSource: image.ImageSource,
                                 name: string, fileName: string, needsPackProperties?: boolean | undefined) => {
      let checkResult: boolean = true
      if (name === "test_exif_v2") {
        if (needsPackProperties) {
          for (let i = 0; i < PropertyKey.length; i++) {
            const key = PropertyKey[i]
            checkResult = await propertyComp(tag, key, newImageSource, oldImageSource, fileName)
            if (!checkResult) {
              return checkResult
            }
          }
        } else {
          for (let i = 0; i < PropertyKey.length; i++) {
            const key = PropertyKey[i]
            checkResult = await propertyCompFalse(tag, key, newImageSource, fileName)
            if (!checkResult) {
              return checkResult
            }
          }
        }
      } else if (name === "test_exif_v3") {
        if (needsPackProperties) {
          const key = image.PropertyKey.ORIENTATION
          checkResult = await propertyComp(tag, key, newImageSource, oldImageSource, fileName)
          if (!checkResult) {
            return checkResult
          }
        } else {
          const key = image.PropertyKey.ORIENTATION
          checkResult = await propertyCompFalse(tag, key, newImageSource, fileName)
          if (!checkResult) {
            return checkResult
          }
        }
      } else {
        for (let i = 0; i < PropertyKey.length; i++) {
          const key = PropertyKey[i]
          checkResult = await propertyCompFalse(tag, key, newImageSource, fileName)
          if (!checkResult) {
            return checkResult
          }
        }
      }
      return checkResult
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

    const getFdCacheDir = async (tag: string, fileNameEnd: string) => {
      const uri: string = cacheDir + '/' + tag + `.${fileNameEnd}`;
      const file: fileIo.File = fs.openSync(uri, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      return file.fd
    }

    const getBuffer = async (fileName: string) => {
      filePath = filesDir + '/' + fileName;
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead)
      return bufferRead
    }

    const getImageSource = async (fileName: string, type?: string) => {
      let imageSourceApi: image.ImageSource
      if (type === "buffer") {
        const buffer = await getBuffer(fileName)
        imageSourceApi = image.createImageSource(buffer)
      } else if (type === "uri") {
        const filePath = filesDir + '/' + fileName
        imageSourceApi = image.createImageSource(filePath)
      } else if (type === "rawfile") {
        const resourceMgr: resourceManager.ResourceManager = testContext.createModuleContext("entry_test").resourceManager
        const rawFileDescriptor = await resourceMgr.getRawFd(fileName)
        imageSourceApi = image.createImageSource(rawFileDescriptor)
      } else if (type === "incremental") {
        const picBuffer = await getBuffer(fileName)
        imageSourceApi = image.CreateIncrementalSource(picBuffer)
      } else {
        const filePath = filesDir + "/" + fileName;
        const file = fs.openSync(filePath)
        imageSourceApi = image.createImageSource(file.fd);
      }
      return imageSourceApi
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
      let newImageSource: image.ImageSource
      if (caseType === "pixelMap") {
        const result = await getPixelMap(fileName, type)
        const pixelMap = result.pixelMap
        oldImageSource = result.imageSource
        if (packType === "packing") {
          imageData = await imagePackerApi.packing(pixelMap, packOpts)
          newImageSource = image.createImageSource(imageData);
        } else {
          const fdNum = await getFdCacheDir(tag, fileNameEnd)
          await imagePackerApi.packToFile(pixelMap, fdNum, packOpts)
          newImageSource = image.createImageSource(fdNum);
        }
      } else {
        const imageSourceApi = await getImageSource(fileName, type)
        oldImageSource = imageSourceApi
        if (packType === "packing") {
          imageData = await imagePackerApi.packing(imageSourceApi, packOpts)
          newImageSource = image.createImageSource(imageData);
        } else {
          const fdNum = await getFdCacheDir(tag, fileNameEnd)
          await imagePackerApi.packToFile(imageSourceApi, fdNum, packOpts)
          newImageSource = image.createImageSource(fdNum);
        }
      }
      const result = await checkProperty(tag, newImageSource, oldImageSource, name, fileName, needsPackProperties)
      return result
    }


    const checkPack = async (err: BusinessError, tag: string, imageData: ArrayBuffer, name: string, fileName: string,
                             oldImageSource: image.ImageSource, fdNum: number, checkType: string, needsPackProperties?: boolean | undefined) => {
      let result = false
      if (!err) {
        let newImageSource: image.ImageSource
        if (checkType == "data") {
          newImageSource = image.createImageSource(imageData);
        } else {
          newImageSource = image.createImageSource(fdNum);
        }
        try {
          result = await checkProperty(tag, newImageSource, oldImageSource, name, fileName, needsPackProperties)
        } catch (error) {
          result = false
        }
      }
      return result
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
      if (caseType === "pixelMap") {
        const result = await getPixelMap(fileName, type)
        const pixelMap = result.pixelMap
        oldImageSource = result.imageSource
        if (packType === "packing") {
          imagePackerApi.packing(pixelMap, packOpts, async (err: BusinessError, imageData: ArrayBuffer) => {
            cResult = await checkPack(err, tag, imageData, name, fileName, oldImageSource, 0, "data", needsPackProperties)
          })
        } else {
          const fdNum = await getFdCacheDir(tag, fileNameEnd)
          imagePackerApi.packToFile(pixelMap, fdNum, packOpts, async (err: BusinessError) => {
            cResult = await checkPack(err, tag, new ArrayBuffer(0), name, fileName, oldImageSource, fdNum, "fd", needsPackProperties)
          })
        }
      } else {
        const imageSourceApi = await getImageSource(fileName, type)
        oldImageSource = imageSourceApi
        if (packType === "packing") {
          imagePackerApi.packing(imageSourceApi, packOpts, async (err: BusinessError, imageData: ArrayBuffer) => {
            cResult = await checkPack(err, tag, imageData, name, fileName, oldImageSource, 0, "data", needsPackProperties)
          })
        } else {
          const fdNum = await getFdCacheDir(tag, fileNameEnd)
          imagePackerApi.packToFile(imageSourceApi, fdNum, packOpts, async (err: BusinessError) => {
            cResult = await checkPack(err, tag, new ArrayBuffer(0), name, fileName, oldImageSource, fdNum, "fd", needsPackProperties)
          })
        }
      }
      await sleep(3000)
      return cResult
    }


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0100
     * @tc.name      : packing -promise
     * @tc.desc      : 1.modifyImageProperty
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0100"
      try {
        let compResult = true
        for (let i = 0; i < picMimeType.length; i++) {
          const name: string = picMimeType[i].name
          const mimeType: string = picMimeType[i].mimeType
          const fileSuffix = picMimeType[i].fileSuffix
          const result = await checkPackImageSourcePixelMapPromise(
            mimeType, name, fileSuffix, tag, "imageSource", "packing", true, "buffer")
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0200
     * @tc.name      : packing -promise
     * @tc.desc      : 1.modifyImageProperty
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0200', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0200"
      try {
        let compResult = true
        for (let i = 0; i < picMimeType.length; i++) {
          const name: string = picMimeType[i].name
          const mimeType: string = picMimeType[i].mimeType
          const fileSuffix = picMimeType[i].fileSuffix
          const result = await checkPackImageSourcePixelMapPromise(
            mimeType, name, fileSuffix, tag, "imageSource", "packing", false, "buffer")
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0300
     * @tc.name      : packing -promise
     * @tc.desc      : 1.modifyImageProperty
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0300', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0300"
      try {
        let compResult = true
        for (let i = 0; i < picMimeType.length; i++) {
          const name: string = picMimeType[i].name
          const mimeType: string = picMimeType[i].mimeType
          const fileSuffix = picMimeType[i].fileSuffix
          const result = await checkPackImageSourcePixelMapPromise(
            mimeType, name, fileSuffix, tag, "imageSource", "packing")
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_PIXELMAP_PROMISE_0100
     * @tc.name      : packing -promise
     * @tc.desc      : 1.packing
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKING_PIXELMAP_PROMISE_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PACKING_PIXELMAP_PROMISE_0100"
      try {
        let compResult = true
        for (let i = 0; i < picMimeType.length; i++) {
          const name: string = picMimeType[i].name
          const mimeType: string = picMimeType[i].mimeType
          const fileSuffix = picMimeType[i].fileSuffix
          const result = await checkPackImageSourcePixelMapPromise(
            mimeType, name, fileSuffix, tag, "pixelMap", "packing", true, "uri")
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_PIXELMAP_PROMISE_0200
     * @tc.name      : packing -promise
     * @tc.desc      : 1.packing
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKING_PIXELMAP_PROMISE_0200', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PACKING_PIXELMAP_PROMISE_0200"
      try {
        let compResult = true
        for (let i = 0; i < picMimeType.length; i++) {
          const name: string = picMimeType[i].name
          const mimeType: string = picMimeType[i].mimeType
          const fileSuffix = picMimeType[i].fileSuffix
          const result = await checkPackImageSourcePixelMapPromise(
            mimeType, name, fileSuffix, tag, "pixelMap", "packing", false, "uri")
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_PIXELMAP_PROMISE_0300
     * @tc.name      : packing -promise
     * @tc.desc      : 1.packing
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKING_PIXELMAP_PROMISE_0300', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PACKING_PIXELMAP_PROMISE_0300"
      try {
        let compResult = true
        for (let i = 0; i < picMimeType.length; i++) {
          const name: string = picMimeType[i].name
          const mimeType: string = picMimeType[i].mimeType
          const fileSuffix = picMimeType[i].fileSuffix
          const result = await checkPackImageSourcePixelMapPromise(
            mimeType, name, fileSuffix, tag, "pixelMap", "packing")
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_PROMISE_0100
     * @tc.name      : packToFile -promise
     * @tc.desc      : 1.packToFile
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_PROMISE_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_PROMISE_0100"
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_PROMISE_0200
     * @tc.name      : packToFile -promise
     * @tc.desc      : 1.packToFile
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_PROMISE_0200', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_PROMISE_0200"
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_PROMISE_0300
     * @tc.name      : packToFile -promise
     * @tc.desc      : 1.packToFile
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_PROMISE_0300', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_PROMISE_0300"
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_PROMISE_0100
     * @tc.name      : packToFile -promise
     * @tc.desc      : 1.packToFile
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_PROMISE_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_PROMISE_0100"
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_PROMISE_0200
     * @tc.name      : packToFile -promise
     * @tc.desc      : 1.packToFile
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_PROMISE_0200', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_PROMISE_0200"
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_PROMISE_0300
     * @tc.name      : packToFile -promise
     * @tc.desc      : 1.packToFile
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_PROMISE_0300', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_PROMISE_0300"
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_PIXELMAP_CALLBACK_0100
     * @tc.name      : packing -callback
     * @tc.desc      : 1.packing                                                                                                                                                                           sc      : 1.modifyImageProperty
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKING_PIXELMAP_CALLBACK_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PACKING_PIXELMAP_CALLBACK_0100"
      try {
        let compResult = true
        for (let i = 0; i < picMimeType.length; i++) {
          const name: string = picMimeType[i].name
          const mimeType: string = picMimeType[i].mimeType
          const fileSuffix: string = picMimeType[i].fileSuffix
          const result = await checkPackImageSourcePixelMapCallBack(
            mimeType, name, fileSuffix, tag, "pixelMap", "packing", true)
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_PIXELMAP_CALLBACK_0200
     * @tc.name      : packing -callback
     * @tc.desc      : 1.packing                                                                                                                                                                           sc      : 1.modifyImageProperty
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKING_PIXELMAP_CALLBACK_0200', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PACKING_PIXELMAP_CALLBACK_0200"
      try {
        let compResult = true
        for (let i = 0; i < picMimeType.length; i++) {
          const name: string = picMimeType[i].name
          const mimeType: string = picMimeType[i].mimeType
          const fileSuffix: string = picMimeType[i].fileSuffix
          const result = await checkPackImageSourcePixelMapCallBack(
            mimeType, name, fileSuffix, tag, "pixelMap", "packing", false)
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_PIXELMAP_CALLBACK_0300
     * @tc.name      : packing -callback
     * @tc.desc      : 1.packing                                                                                                                                                                           sc      : 1.modifyImageProperty
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKING_PIXELMAP_CALLBACK_0300', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PACKING_PIXELMAP_CALLBACK_0300"
      try {
        let compResult = true
        for (let i = 0; i < picMimeType.length; i++) {
          const name: string = picMimeType[i].name
          const mimeType: string = picMimeType[i].mimeType
          const fileSuffix: string = picMimeType[i].fileSuffix
          const result = await checkPackImageSourcePixelMapCallBack(
            mimeType, name, fileSuffix, tag, "pixelMap", "packing")
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0100
     * @tc.name      : packing -callback
     * @tc.desc      : 1.packing
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0100"
      try {
        let compResult = true
        for (let i = 0; i < picMimeType.length; i++) {
          const name: string = picMimeType[i].name
          const mimeType: string = picMimeType[i].mimeType
          const fileSuffix: string = picMimeType[i].fileSuffix
          const result = await checkPackImageSourcePixelMapCallBack(
            mimeType, name, fileSuffix, tag, "imageSource", "packing", true)
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0200
     * @tc.name      : packing -callback
     * @tc.desc      : 1.packing
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0200', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0200"
      try {
        let compResult = true
        for (let i = 0; i < picMimeType.length; i++) {
          const name: string = picMimeType[i].name
          const mimeType: string = picMimeType[i].mimeType
          const fileSuffix: string = picMimeType[i].fileSuffix
          const result = await checkPackImageSourcePixelMapCallBack(
            mimeType, name, fileSuffix, tag, "imageSource", "packing", false)
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0300
     * @tc.name      : packing -callback
     * @tc.desc      : 1.packing
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0300', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0300"
      try {
        let compResult = true
        for (let i = 0; i < picMimeType.length; i++) {
          const name: string = picMimeType[i].name
          const mimeType: string = picMimeType[i].mimeType
          const fileSuffix: string = picMimeType[i].fileSuffix
          const result = await checkPackImageSourcePixelMapCallBack(
            mimeType, name, fileSuffix, tag, "imageSource", "packing")
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_CALLBACK_0100
     * @tc.name      : packToFile -callback
     * @tc.desc      : 1.packToFile
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_CALLBACK_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_CALLBACK_0100"
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_CALLBACK_0200
     * @tc.name      : packToFile -callback
     * @tc.desc      : 1.packToFile
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_CALLBACK_0200', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_CALLBACK_0200"
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_CALLBACK_0300
     * @tc.name      : packToFile -callback
     * @tc.desc      : 1.packToFile
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_CALLBACK_0300', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_CALLBACK_0300"
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_CALLBACK_0100
     * @tc.name      : packToFile -callback
     * @tc.desc      : 1.packToFile
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_CALLBACK_0100', 0, async (done: Function) => {
      const tag: string = 'SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_CALLBACK_0100'
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_CALLBACK_0200
     * @tc.name      : packToFile -callback
     * @tc.desc      : 1.packToFile
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_CALLBACK_0200', 0, async (done: Function) => {
      const tag: string = 'SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_CALLBACK_0200'
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_CALLBACK_0300
     * @tc.name      : packToFile -callback
     * @tc.desc      : 1.packToFile
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_CALLBACK_0300', 0, async (done: Function) => {
      const tag: string = 'SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_CALLBACK_0300'
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