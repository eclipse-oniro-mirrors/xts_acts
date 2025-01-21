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
import { describe, it, beforeAll, expect } from '@ohos/hypium'
import fs from '@ohos.file.fs';
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import resourceManager from '@ohos.resourceManager';

let testContext: common.UIAbilityContext;

export default function abilityTest() {
  describe('imageFormatTranscoding', () => {
    beforeAll(async () => {
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
    });

    let fdNumber: number;
    let filePath: string;

    const getFd = async (fileName: string) => {
      filePath = AppStorage.get('pathDir') + "/" + fileName;
      const file = fs.openSync(filePath)
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

    const getImageSource = async(fileName:string, type:string)=>{
      let imageSourceApi:image.ImageSource
      if(type === "buffer"){
        const buffer = await getBuffer(fileName)
        imageSourceApi = image.createImageSource(buffer)
      }else if(type === "uri"){
        const filePath = AppStorage.get('pathDir') + '/' + fileName
        imageSourceApi = image.createImageSource(filePath)
      }else if(type === "rawfile"){
        const resourceMgr: resourceManager.ResourceManager = testContext.createModuleContext("entry").resourceManager
        const rawFileDescriptor = await resourceMgr.getRawFd(fileName)
        imageSourceApi = image.createImageSource(rawFileDescriptor)
        }else if(type === "incremental") {
          const picBuffer = await getBuffer(fileName)
          imageSourceApi = image.CreateIncrementalSource(picBuffer)
      } else {
        await getFd(fileName)
        imageSourceApi = image.createImageSource(fdNumber);
      }
      return imageSourceApi
    }

    const getPixelMap = async (fileName:string, type:string, width: number, height: number, desiredPixelFormat: number,) => {
      const imageSourceApi = await getImageSource(fileName, type);
      hilog.info(0x0000, 'testTag', '%{public}s', `CPF_1:${JSON.stringify(await imageSourceApi.getImageInfo())}`);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {
          width: width, height: height
        },
        desiredPixelFormat: desiredPixelFormat,
      }
      let pixelMap = await imageSourceApi.createPixelMap(decodingOptions);
      hilog.info(0x0000, 'testTag', '%{public}s', `CPF_2:${JSON.stringify(await pixelMap.getImageInfo())}`);
      return pixelMap;
    }

    let VerifyPixelMap = async (testNum: string, pixelMap: image.PixelMap,
                                          width: number, height: number, format: number) => {
      let compareImageInfo: image.ImageInfo | undefined
      compareImageInfo = await pixelMap.getImageInfo()
      hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}: compareImageInfo${JSON.stringify(compareImageInfo)}`)
      const pixelMapHeight = compareImageInfo.size.height
      const pixelMapWidth = compareImageInfo.size.width
      const pixelFormat = compareImageInfo.pixelFormat
      return pixelMapHeight === height && pixelMapWidth === width && pixelFormat === format;
    }

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_I_I_TS_0100
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV12_I_I_TS_0100', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'buffer', 800, 500, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.NV21).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_I_I_TS_0200
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV12_I_I_TS_0200', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800500.jpg', 'uri', 800, 500, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_8888)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV12_I_I_TS_0200', pixelMap, 800, 500, image.PixelMapFormat.RGBA_8888)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_I_I_TS_0300
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV12_I_I_TS_0300', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800500.jpg', 'rawfile', 800, 500, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.BGRA_8888)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV12_I_I_TS_0300', pixelMap, 800, 500, image.PixelMapFormat.BGRA_8888)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_I_I_TS_0400
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV12_I_I_TS_0400', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800500.jpg', 'fd', 800, 500, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV12_I_I_TS_0400', pixelMap, 800, 500, image.PixelMapFormat.RGB_888)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_I_I_TS_0500
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV12_I_I_TS_0500', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800500.jpg', 'buffer', 800, 500, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_565)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV12_I_I_TS_0500', pixelMap, 800, 500, image.PixelMapFormat.RGB_565)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_I_I_TS_0600
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV12_I_I_TS_0600', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800500.jpg', 'uri', 800, 500, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV12_I_I_TS_0600', pixelMap, 800, 500, image.PixelMapFormat.RGBA_F16)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_I_I_TS_0700
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV12_I_I_TS_0700', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'rawfile', 800, 500, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.UNKNOWN).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_I_I_TS_0800
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV12_I_I_TS_0800', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'fd', 800, 500, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.ALPHA_8).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_I_I_TS_0100
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV21_I_I_TS_0100', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'buffer', 800, 500, image.PixelMapFormat.NV21).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV21
        await pixelMap.convertPixelFormat(image.PixelMapFormat.NV12).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_I_I_TS_0200
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV21_I_I_TS_0200', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800500.jpg', 'uri', 800, 500, image.PixelMapFormat.NV21)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV21
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_8888)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV21_I_I_TS_0200', pixelMap, 800, 500, image.PixelMapFormat.RGBA_8888)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_I_I_TS_0300
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV21_I_I_TS_0300', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800500.jpg', 'rawfile', 800, 500, image.PixelMapFormat.NV21)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV21
      await pixelMap.convertPixelFormat(image.PixelMapFormat.BGRA_8888)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV21_I_I_TS_0300', pixelMap, 800, 500, image.PixelMapFormat.BGRA_8888)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_I_I_TS_0400
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV21_I_I_TS_0400', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800500.jpg', 'fd', 800, 500, image.PixelMapFormat.NV21)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV21
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV21_I_I_TS_0400', pixelMap, 800, 500, image.PixelMapFormat.RGB_888)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_I_I_TS_0500
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV21_I_I_TS_0500', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800500.jpg', 'buffer', 800, 500, image.PixelMapFormat.NV21)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV21
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_565)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV21_I_I_TS_0500', pixelMap, 800, 500, image.PixelMapFormat.RGB_565)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_I_I_TS_0600
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV21_I_I_TS_0600', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800500.jpg', 'uri', 800, 500, image.PixelMapFormat.NV21)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV21
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV21_I_I_TS_0600', pixelMap, 800, 500, image.PixelMapFormat.RGBA_F16)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_I_I_TS_0700
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV21_I_I_TS_0700', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'rawfile', 800, 500, image.PixelMapFormat.NV21).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV21
        await pixelMap.convertPixelFormat(image.PixelMapFormat.UNKNOWN).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_I_I_TS_0800
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV21_I_I_TS_0800', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'fd', 800, 500, image.PixelMapFormat.NV21).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV21
        await pixelMap.convertPixelFormat(image.PixelMapFormat.ALPHA_8).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBA8888_I_I_TS_0100
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBA8888_I_I_TS_0100', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800500.jpg', 'buffer', 800, 500, image.PixelMapFormat.RGBA_8888)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGBA_8888
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV12)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_RGBA8888_I_I_TS_0100', pixelMap, 800, 500, image.PixelMapFormat.NV12)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBA8888_I_I_TS_0200
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBA8888_I_I_TS_0200', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800500.jpg', 'uri', 800, 500, image.PixelMapFormat.RGBA_8888)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGBA_8888
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV21)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_RGBA8888_I_I_TS_0200', pixelMap, 800, 500, image.PixelMapFormat.NV21)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBA8888_I_I_TS_0300
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBA8888_I_I_TS_0300', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'rawfile', 800, 500, image.PixelMapFormat.RGBA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGBA_8888
          await pixelMap.convertPixelFormat(image.PixelMapFormat.BGRA_8888).catch((err: BusinessError) => {
            expect(resultpixelMap).assertTrue();
            expect(err.code).assertEqual('62980115');
          })
        })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBA8888_I_I_TS_0300
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBA8888_I_I_TS_0400', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'fd', 800, 500, image.PixelMapFormat.RGBA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGBA_8888
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBA8888_I_I_TS_0500
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBA8888_I_I_TS_0500', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'buffer', 800, 500, image.PixelMapFormat.RGBA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGBA_8888
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_565).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBA8888_I_I_TS_0600
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBA8888_I_I_TS_0600', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'uri', 800, 500, image.PixelMapFormat.RGBA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGBA_8888
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBA8888_I_I_TS_0700
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBA8888_I_I_TS_0700', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'rawfile', 800, 500, image.PixelMapFormat.RGBA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGBA_8888
          await pixelMap.convertPixelFormat(image.PixelMapFormat.UNKNOWN).catch((err: BusinessError) => {
            expect(resultpixelMap).assertTrue();
            expect(err).assertEqual(62980115);
          })
        })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBA8888_I_I_TS_0800
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBA8888_I_I_TS_0800', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'fd', 800, 500, image.PixelMapFormat.RGBA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGBA_8888
        await pixelMap.convertPixelFormat(image.PixelMapFormat.ALPHA_8).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_BGRA8888_I_I_TS_0100
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_BGRA8888_I_I_TS_0100', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800500.jpg', 'buffer', 800, 500, image.PixelMapFormat.BGRA_8888)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.BGRA_8888
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV12)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_BGRA8888_I_I_TS_0100', pixelMap, 800, 500, image.PixelMapFormat.NV12)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_BGRA8888_I_I_TS_0200
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_BGRA8888_I_I_TS_0200', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800500.jpg', 'uri', 800, 500, image.PixelMapFormat.BGRA_8888)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.BGRA_8888
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV21)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_BGRA8888_I_I_TS_0200', pixelMap, 800, 500, image.PixelMapFormat.NV21)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_BGRA8888_I_I_TS_0300
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_BGRA8888_I_I_TS_0300', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'rawfile', 800, 500, image.PixelMapFormat.BGRA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.BGRA_8888
          await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_8888).catch((err: BusinessError) => {
            expect(resultpixelMap).assertTrue();
            expect(err.code).assertEqual('62980115');
          })
        })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_BGRA8888_I_I_TS_0400
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_BGRA8888_I_I_TS_0400', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'fd', 800, 500, image.PixelMapFormat.BGRA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.BGRA_8888
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_BGRA8888_I_I_TS_0500
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_BGRA8888_I_I_TS_0500', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'buffer', 800, 500, image.PixelMapFormat.BGRA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.BGRA_8888
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_565).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_BGRA8888_I_I_TS_0600
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_BGRA8888_I_I_TS_0600', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'uri', 800, 500, image.PixelMapFormat.BGRA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.BGRA_8888
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_BGRA8888_I_I_TS_0700
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_BGRA8888_I_I_TS_0700', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'rawfile', 800, 500, image.PixelMapFormat.BGRA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.BGRA_8888
          await pixelMap.convertPixelFormat(image.PixelMapFormat.UNKNOWN).catch((err: BusinessError) => {
            expect(resultpixelMap).assertTrue();
            expect(err).assertEqual(62980115);
          })
        })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_BGRA8888_I_I_TS_0800
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_BGRA8888_I_I_TS_0800', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'fd', 800, 500, image.PixelMapFormat.BGRA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.BGRA_8888
        await pixelMap.convertPixelFormat(image.PixelMapFormat.ALPHA_8).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB565_I_I_TS_0100
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB565_I_I_TS_0100', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800500.jpg', 'buffer', 800, 500, image.PixelMapFormat.RGB_565)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGB_565
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV12)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_RGB565_I_I_TS_0100', pixelMap, 800, 500, image.PixelMapFormat.NV12)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB565_I_I_TS_0200
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB565_I_I_TS_0200', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800500.jpg', 'uri', 800, 500, image.PixelMapFormat.RGB_565)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGB_565
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV21)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_RGB565_I_I_TS_0200', pixelMap, 800, 500, image.PixelMapFormat.NV21)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB565_I_I_TS_0300
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB565_I_I_TS_0300', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'rawfile', 800, 500, image.PixelMapFormat.RGB_565).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGB_565
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_8888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB565_I_I_TS_0400
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB565_I_I_TS_0400', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'fd', 800, 500, image.PixelMapFormat.RGB_565).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGB_565
        await pixelMap.convertPixelFormat(image.PixelMapFormat.BGRA_8888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB565_I_I_TS_0500
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB565_I_I_TS_0500', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'buffer', 800, 500, image.PixelMapFormat.RGB_565).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGB_565
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB565_I_I_TS_0600
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB565_I_I_TS_0600', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'uri', 800, 500, image.PixelMapFormat.RGB_565).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGB_565
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB565_I_I_TS_0700
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB565_I_I_TS_0700', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'rawfile', 800, 500, image.PixelMapFormat.RGB_565).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGB_565
        await pixelMap.convertPixelFormat(image.PixelMapFormat.UNKNOWN).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB565_I_I_TS_0800
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB565_I_I_TS_0800', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'fd', 800, 500, image.PixelMapFormat.RGB_565).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGB_565
        await pixelMap.convertPixelFormat(image.PixelMapFormat.ALPHA_8).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB888_I_I_TS_0100
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB888_I_I_TS_0100', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800500.jpg', 'buffer', 800, 500, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV12)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_RGB888_I_I_TS_0100', pixelMap, 800, 500, image.PixelMapFormat.NV12)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB888_I_I_TS_0200
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB888_I_I_TS_0200', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800500.jpg', 'uri', 800, 500, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV21)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_RGB888_I_I_TS_0200', pixelMap, 800, 500, image.PixelMapFormat.NV21)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB888_I_I_TS_0300
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB888_I_I_TS_0300', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'rawfile', 800, 500, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_8888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB888_I_I_TS_0400
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB888_I_I_TS_0400', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'fd', 800, 500, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.BGRA_8888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB888_I_I_TS_0500
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB888_I_I_TS_0500', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'buffer', 800, 500, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_565).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB888_I_I_TS_0600
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB888_I_I_TS_0600', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'uri', 800, 500, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB888_I_I_TS_0700
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB888_I_I_TS_0700', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'rawfile', 800, 500, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.UNKNOWN).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB888_I_I_TS_0800
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB888_I_I_TS_0800', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'fd', 800, 500, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.ALPHA_8).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBAF16_I_I_TS_0100
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBAF16_I_I_TS_0100', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800500.jpg', 'buffer', 800, 500, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV12)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_RGBAF16_I_I_TS_0100', pixelMap, 800, 500, image.PixelMapFormat.NV12)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBAF16_I_I_TS_0200
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBAF16_I_I_TS_0200', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800500.jpg', 'uri', 800, 500, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV21)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_RGBAF16_I_I_TS_0200', pixelMap, 800, 500, image.PixelMapFormat.NV21)
      expect(result && resultpixelMap).assertTrue()
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBAF16_I_I_TS_0300
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBAF16_I_I_TS_0300', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'rawfile', 800, 500, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_8888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBAF16_I_I_TS_0400
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBAF16_I_I_TS_0400', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'fd', 800, 500, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.BGRA_8888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBAF16_I_I_TS_0500
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBAF16_I_I_TS_0500', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'buffer', 800, 500, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_565).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBAF16_I_I_TS_0600
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBAF16_I_I_TS_0600', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'uri', 800, 500, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBAF16_I_I_TS_0700
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBAF16_I_I_TS_0700', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'rawfile', 800, 500, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.UNKNOWN).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBAF16_I_I_TS_0800
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBAF16_I_I_TS_0800', 0, async (done: Function) => {
      await getPixelMap('JPG_800500.jpg', 'fd', 800, 500, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.ALPHA_8).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_odd_I_TS_0100
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV12_odd_I_TS_0100', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'buffer', 801, 500, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.NV21).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_odd_I_TS_0200
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV12_odd_I_TS_0200', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801500.jpg', 'uri', 801, 500, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_8888)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV12_odd_I_TS_0200', pixelMap, 801, 500, image.PixelMapFormat.RGBA_8888)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_odd_I_TS_0300
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV12_odd_I_TS_0300', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801500.jpg', 'rawfile', 801, 500, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.BGRA_8888)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV12_odd_I_TS_0300', pixelMap, 801, 500, image.PixelMapFormat.BGRA_8888)
      expect(result && resultpixelMap).assertTrue();
      done();
    })
    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_odd_I_TS_0400
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV12_odd_I_TS_0400', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801500.jpg', 'fd', 801, 500, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV12_odd_I_TS_0400', pixelMap, 801, 500, image.PixelMapFormat.RGB_888)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_odd_I_TS_0500
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV12_odd_I_TS_0500', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801500.jpg', 'buffer', 801, 500, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_565)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV12_odd_I_TS_0500', pixelMap, 801, 500, image.PixelMapFormat.RGB_565)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_odd_I_TS_0600
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV12_odd_I_TS_0600', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801500.jpg', 'uri', 801, 500, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV12_odd_I_TS_0600', pixelMap, 801, 500, image.PixelMapFormat.RGBA_F16)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_odd_I_TS_0700
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV12_odd_I_TS_0700', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'rawfile', 801, 500, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.UNKNOWN).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_odd_I_TS_0800
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV12_odd_I_TS_0800', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'fd', 801, 500, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.ALPHA_8).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_odd_I_TS_0100
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV21_odd_I_TS_0100', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'buffer', 801, 500, image.PixelMapFormat.NV21).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV21
        await pixelMap.convertPixelFormat(image.PixelMapFormat.NV12).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_odd_I_TS_0200
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV21_odd_I_TS_0200', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801500.jpg', 'uri', 801, 500, image.PixelMapFormat.NV21)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV21
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_8888)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV21_odd_I_TS_0200', pixelMap, 801, 500, image.PixelMapFormat.RGBA_8888)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_odd_I_TS_0300
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV21_odd_I_TS_0300', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801500.jpg', 'rawfile', 801, 500, image.PixelMapFormat.NV21)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV21
      pixelMap.convertPixelFormat(image.PixelMapFormat.BGRA_8888)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV21_odd_I_TS_0300', pixelMap, 801, 500, image.PixelMapFormat.BGRA_8888)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_odd_I_TS_0400
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV21_odd_I_TS_0400', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801500.jpg', 'fd', 801, 500, image.PixelMapFormat.NV21)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV21
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV21_odd_I_TS_0400', pixelMap, 801, 500, image.PixelMapFormat.RGB_888)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_odd_I_TS_0500
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV21_odd_I_TS_0500', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801500.jpg', 'buffer', 801, 500, image.PixelMapFormat.NV21)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV21
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_565)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV21_odd_I_TS_0500', pixelMap, 801, 500, image.PixelMapFormat.RGB_565)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_odd_I_TS_0600
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV21_odd_I_TS_0600', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801500.jpg', 'uri', 801, 500, image.PixelMapFormat.NV21)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV21
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV21_odd_I_TS_0600', pixelMap, 801, 500, image.PixelMapFormat.RGBA_F16)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_odd_I_TS_0700
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV21_odd_I_TS_0700', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'rawfile', 801, 500, image.PixelMapFormat.NV21).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV21
        await pixelMap.convertPixelFormat(image.PixelMapFormat.UNKNOWN).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_odd_I_TS_0800
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV21_odd_I_TS_0800', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'fd', 801, 500, image.PixelMapFormat.NV21).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV21
        await pixelMap.convertPixelFormat(image.PixelMapFormat.ALPHA_8).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_I_TS_0100
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_I_TS_0100', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801500.jpg', 'buffer', 801, 500, image.PixelMapFormat.RGBA_8888)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGBA_8888
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV12)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_I_TS_0100', pixelMap, 801, 500, image.PixelMapFormat.NV12)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_I_TS_0200
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_I_TS_0200', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801500.jpg', 'uri', 801, 500, image.PixelMapFormat.RGBA_8888)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGBA_8888
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV21)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_I_TS_0200', pixelMap, 801, 500, image.PixelMapFormat.NV21)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_I_TS_0300
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_I_TS_0300', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'rawfile', 801, 500, image.PixelMapFormat.RGBA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGBA_8888
          await pixelMap.convertPixelFormat(image.PixelMapFormat.BGRA_8888).catch((err: BusinessError) => {
            expect(resultpixelMap).assertTrue();
            expect(err.code).assertEqual('62980115');
          })
        })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_I_TS_0300
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_I_TS_0400', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'fd', 801, 500, image.PixelMapFormat.RGBA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGBA_8888
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_I_TS_0500
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_I_TS_0500', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'buffer', 801, 500, image.PixelMapFormat.RGBA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGBA_8888
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_565).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_I_TS_0600
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_I_TS_0600', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'uri', 801, 500, image.PixelMapFormat.RGBA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGBA_8888
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_I_TS_0700
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_I_TS_0700', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'rawfile', 801, 500, image.PixelMapFormat.RGBA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGBA_8888
          await pixelMap.convertPixelFormat(image.PixelMapFormat.UNKNOWN).catch((err: BusinessError) => {
            expect(resultpixelMap).assertTrue();
            expect(err).assertEqual(62980115);
          })
        })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_I_TS_0800
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_I_TS_0800', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'fd', 801, 500, image.PixelMapFormat.RGBA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGBA_8888
        await pixelMap.convertPixelFormat(image.PixelMapFormat.ALPHA_8).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_I_TS_0100
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_I_TS_0100', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801500.jpg', 'buffer', 801, 500, image.PixelMapFormat.BGRA_8888)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.BGRA_8888
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV12)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_I_TS_0100', pixelMap, 801, 500, image.PixelMapFormat.NV12)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_I_TS_0200
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_I_TS_0200', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801500.jpg', 'uri', 801, 500, image.PixelMapFormat.BGRA_8888)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.BGRA_8888
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV21)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_I_TS_0200', pixelMap, 801, 500, image.PixelMapFormat.NV21)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_I_TS_0300
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_I_TS_0300', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'rawfile', 801, 500, image.PixelMapFormat.BGRA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.BGRA_8888
          await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_8888).catch((err: BusinessError) => {
            expect(resultpixelMap).assertTrue();
            expect(err.code).assertEqual('62980115');
          })
        })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_I_TS_0400
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_I_TS_0400', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'fd', 801, 500, image.PixelMapFormat.BGRA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.BGRA_8888
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_I_TS_0500
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_I_TS_0500', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'buffer', 801, 500, image.PixelMapFormat.BGRA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.BGRA_8888
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_565).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_I_TS_0600
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_I_TS_0600', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'uri', 801, 500, image.PixelMapFormat.BGRA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.BGRA_8888
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_I_TS_0700
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_I_TS_0700', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'rawfile', 801, 500, image.PixelMapFormat.BGRA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.BGRA_8888
          await pixelMap.convertPixelFormat(image.PixelMapFormat.UNKNOWN).catch((err: BusinessError) => {
            expect(resultpixelMap).assertTrue();
            expect(err).assertEqual(62980115);
          })
        })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_I_TS_0800
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_I_TS_0800', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'fd', 801, 500, image.PixelMapFormat.BGRA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.BGRA_8888
        await pixelMap.convertPixelFormat(image.PixelMapFormat.ALPHA_8).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB565_odd_I_TS_0100
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB565_odd_I_TS_0100', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801500.jpg', 'buffer', 801, 500, image.PixelMapFormat.RGB_565)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGB_565
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV12)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_RGB565_odd_I_TS_0100', pixelMap, 801, 500, image.PixelMapFormat.NV12)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB565_odd_I_TS_0200
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB565_odd_I_TS_0200', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801500.jpg', 'uri', 801, 500, image.PixelMapFormat.RGB_565)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGB_565
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV21)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_RGB565_odd_I_TS_0200', pixelMap, 801, 500, image.PixelMapFormat.NV21)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB565_odd_I_TS_0300
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB565_odd_I_TS_0300', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'rawfile', 801, 500, image.PixelMapFormat.RGB_565).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGB_565
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_8888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB565_odd_I_TS_0400
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB565_odd_I_TS_0400', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'fd', 801, 500, image.PixelMapFormat.RGB_565).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGB_565
        await pixelMap.convertPixelFormat(image.PixelMapFormat.BGRA_8888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB565_odd_I_TS_0500
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB565_odd_I_TS_0500', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'buffer', 801, 500, image.PixelMapFormat.RGB_565).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGB_565
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB565_odd_I_TS_0600
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB565_odd_I_TS_0600', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'uri', 801, 500, image.PixelMapFormat.RGB_565).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGB_565
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB565_odd_I_TS_0700
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB565_odd_I_TS_0700', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'rawfile', 801, 500, image.PixelMapFormat.RGB_565).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGB_565
        await pixelMap.convertPixelFormat(image.PixelMapFormat.UNKNOWN).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB565_odd_I_TS_0800
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB565_odd_I_TS_0800', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'fd', 801, 500, image.PixelMapFormat.RGB_565).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGB_565
        await pixelMap.convertPixelFormat(image.PixelMapFormat.ALPHA_8).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB888_odd_I_TS_0100
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB888_odd_I_TS_0100', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801500.jpg', 'buffer', 801, 500, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV12)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_RGB888_odd_I_TS_0100', pixelMap, 801, 500, image.PixelMapFormat.NV12)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB888_odd_I_TS_0200
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB888_odd_I_TS_0200', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801500.jpg', 'uri', 801, 500, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV21)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_RGB888_odd_I_TS_0200', pixelMap, 801, 500, image.PixelMapFormat.NV21)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB888_odd_I_TS_0300
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB888_odd_I_TS_0300', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'rawfile', 801, 500, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_8888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB888_odd_I_TS_0400
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB888_odd_I_TS_0400', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'fd', 801, 500, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.BGRA_8888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB888_odd_I_TS_0500
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB888_odd_I_TS_0500', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'buffer', 801, 500, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_565).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB888_odd_I_TS_0600
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB888_odd_I_TS_0600', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'uri', 801, 500, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB888_odd_I_TS_0700
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB888_odd_I_TS_0700', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'rawfile', 801, 500, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.UNKNOWN).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB888_odd_I_TS_0800
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB888_odd_I_TS_0800', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'fd', 801, 500, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.ALPHA_8).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_I_TS_0100
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_I_TS_0100', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801500.jpg', 'buffer', 801, 500, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV12)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_I_TS_0100', pixelMap, 801, 500, image.PixelMapFormat.NV12)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_I_TS_0200
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_I_TS_0200', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801500.jpg', 'uri', 801, 500, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV21)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_I_TS_0200', pixelMap, 801, 500, image.PixelMapFormat.NV21)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_I_TS_0300
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_I_TS_0300', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'rawfile', 801, 500, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_8888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_I_TS_0400
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_I_TS_0400', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'fd', 801, 500, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.BGRA_8888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_I_TS_0500
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_I_TS_0500', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'buffer', 801, 500, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_565).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_I_TS_0600
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_I_TS_0600', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'uri', 801, 500, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_I_TS_0700
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_I_TS_0700', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'rawfile', 801, 500, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.UNKNOWN).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_I_TS_0800
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_I_TS_0800', 0, async (done: Function) => {
      await getPixelMap('JPG_801500.jpg', 'fd', 801, 500, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.ALPHA_8).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_I_odd_TS_0100
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV12_I_odd_TS_0100', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'buffer', 800, 501, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.NV21).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_I_odd_TS_0200
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV12_I_odd_TS_0200', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800501.jpg', 'uri', 800, 501, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_8888)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV12_I_odd_TS_0200', pixelMap, 800, 501, image.PixelMapFormat.RGBA_8888)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_I_odd_TS_0300
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV12_I_odd_TS_0300', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800501.jpg', 'rawfile', 800, 501, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.BGRA_8888)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV12_I_odd_TS_0300', pixelMap, 800, 501, image.PixelMapFormat.BGRA_8888)
      expect(result && resultpixelMap).assertTrue();
      done();
    })
    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_I_odd_TS_0400
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV12_I_odd_TS_0400', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800501.jpg', 'fd', 800, 501, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV12_I_odd_TS_0400', pixelMap, 800, 501, image.PixelMapFormat.RGB_888)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_I_odd_TS_0500
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV12_I_odd_TS_0500', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800501.jpg', 'buffer', 800, 501, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_565)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV12_I_odd_TS_0500', pixelMap, 800, 501, image.PixelMapFormat.RGB_565)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_I_odd_TS_0600
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV12_I_odd_TS_0600', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800501.jpg', 'uri', 800, 501, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV12_I_odd_TS_0600', pixelMap, 800, 501, image.PixelMapFormat.RGBA_F16)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_I_odd_TS_0700
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV12_I_odd_TS_0700', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'rawfile', 800, 501, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.UNKNOWN).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_I_odd_TS_0800
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV12_I_odd_TS_0800', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'fd', 800, 501, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.ALPHA_8).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_I_odd_TS_0100
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV21_I_odd_TS_0100', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'buffer', 800, 501, image.PixelMapFormat.NV21).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV21
        await pixelMap.convertPixelFormat(image.PixelMapFormat.NV12).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_I_odd_TS_0200
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV21_I_odd_TS_0200', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800501.jpg', 'uri', 800, 501, image.PixelMapFormat.NV21)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV21
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_8888)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV21_I_odd_TS_0200', pixelMap, 800, 501, image.PixelMapFormat.RGBA_8888)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_I_odd_TS_0300
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV21_I_odd_TS_0300', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800501.jpg', 'rawfile', 800, 501, image.PixelMapFormat.NV21)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV21
      await pixelMap.convertPixelFormat(image.PixelMapFormat.BGRA_8888)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV21_I_odd_TS_0300', pixelMap, 800, 501, image.PixelMapFormat.BGRA_8888)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_I_odd_TS_0400
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV21_I_odd_TS_0400', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800501.jpg', 'fd', 800, 501, image.PixelMapFormat.NV21)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV21
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV21_I_odd_TS_0400', pixelMap, 800, 501, image.PixelMapFormat.RGB_888)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_I_odd_TS_0500
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV21_I_odd_TS_0500', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800501.jpg', 'buffer', 800, 501, image.PixelMapFormat.NV21)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV21
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_565)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV21_I_odd_TS_0500', pixelMap, 800, 501, image.PixelMapFormat.RGB_565)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_I_odd_TS_0600
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV21_I_odd_TS_0600', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800501.jpg', 'uri', 800, 501, image.PixelMapFormat.NV21)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV21
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV21_I_odd_TS_0600', pixelMap, 800, 501, image.PixelMapFormat.RGBA_F16)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_I_odd_TS_0700
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV21_I_odd_TS_0700', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'rawfile', 800, 501, image.PixelMapFormat.NV21).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV21
        await pixelMap.convertPixelFormat(image.PixelMapFormat.UNKNOWN).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_I_odd_TS_0800
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV21_I_odd_TS_0800', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'fd', 800, 501, image.PixelMapFormat.NV21).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV21
        await pixelMap.convertPixelFormat(image.PixelMapFormat.ALPHA_8).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBA8888_I_odd_TS_0100
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBA8888_I_odd_TS_0100', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800501.jpg', 'buffer', 800, 501, image.PixelMapFormat.RGBA_8888)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGBA_8888
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV12)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_RGBA8888_I_odd_TS_0100', pixelMap, 800, 501, image.PixelMapFormat.NV12)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBA8888_I_odd_TS_0200
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBA8888_I_odd_TS_0200', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800501.jpg', 'uri', 800, 501, image.PixelMapFormat.RGBA_8888)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGBA_8888
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV21)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_RGBA8888_I_odd_TS_0200', pixelMap, 800, 501, image.PixelMapFormat.NV21)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBA8888_I_odd_TS_0300
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBA8888_I_odd_TS_0300', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'rawfile', 800, 501, image.PixelMapFormat.RGBA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGBA_8888
          await pixelMap.convertPixelFormat(image.PixelMapFormat.BGRA_8888).catch((err: BusinessError) => {
            expect(resultpixelMap).assertTrue();
            expect(err.code).assertEqual('62980115');
          })
        })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBA8888_I_odd_TS_0300
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBA8888_I_odd_TS_0400', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'fd', 800, 501, image.PixelMapFormat.RGBA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGBA_8888
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBA8888_I_odd_TS_0500
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBA8888_I_odd_TS_0500', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'buffer', 800, 501, image.PixelMapFormat.RGBA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGBA_8888
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_565).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBA8888_I_odd_TS_0600
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBA8888_I_odd_TS_0600', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'uri', 800, 501, image.PixelMapFormat.RGBA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGBA_8888
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBA8888_I_odd_TS_0700
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBA8888_I_odd_TS_0700', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'rawfile', 800, 501, image.PixelMapFormat.RGBA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGBA_8888
          await pixelMap.convertPixelFormat(image.PixelMapFormat.UNKNOWN).catch((err: BusinessError) => {
            expect(resultpixelMap).assertTrue();
            expect(err).assertEqual(62980115);
          })
        })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBA8888_I_odd_TS_0800
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBA8888_I_odd_TS_0800', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'fd', 800, 501, image.PixelMapFormat.RGBA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGBA_8888
        await pixelMap.convertPixelFormat(image.PixelMapFormat.ALPHA_8).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_BGRA8888_I_odd_TS_0100
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_BGRA8888_I_odd_TS_0100', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800501.jpg', 'buffer', 800, 501, image.PixelMapFormat.BGRA_8888)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.BGRA_8888
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV12)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_BGRA8888_I_odd_TS_0100', pixelMap, 800, 501, image.PixelMapFormat.NV12)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_BGRA8888_I_odd_TS_0200
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_BGRA8888_I_odd_TS_0200', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800501.jpg', 'uri', 800, 501, image.PixelMapFormat.BGRA_8888)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.BGRA_8888
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV21)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_BGRA8888_I_odd_TS_0200', pixelMap, 800, 501, image.PixelMapFormat.NV21)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_BGRA8888_I_odd_TS_0300
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_BGRA8888_I_odd_TS_0300', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'rawfile', 800, 501, image.PixelMapFormat.BGRA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.BGRA_8888
          await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_8888).catch((err: BusinessError) => {
            expect(resultpixelMap).assertTrue();
            expect(err.code).assertEqual('62980115');
          })
        })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_BGRA8888_I_odd_TS_0400
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_BGRA8888_I_odd_TS_0400', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'fd', 800, 501, image.PixelMapFormat.BGRA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.BGRA_8888
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_BGRA8888_I_odd_TS_0500
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_BGRA8888_I_odd_TS_0500', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'buffer', 800, 501, image.PixelMapFormat.BGRA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.BGRA_8888
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_565).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_BGRA8888_I_odd_TS_0600
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_BGRA8888_I_odd_TS_0600', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'uri', 800, 501, image.PixelMapFormat.BGRA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.BGRA_8888
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_BGRA8888_I_odd_TS_0700
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_BGRA8888_I_odd_TS_0700', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'rawfile', 800, 501, image.PixelMapFormat.BGRA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.BGRA_8888
          await pixelMap.convertPixelFormat(image.PixelMapFormat.UNKNOWN).catch((err: BusinessError) => {
            expect(resultpixelMap).assertTrue();
            expect(err).assertEqual(62980115);
          })
        })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_BGRA8888_I_odd_TS_0800
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_BGRA8888_I_odd_TS_0800', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'fd', 800, 501, image.PixelMapFormat.BGRA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.BGRA_8888
        await pixelMap.convertPixelFormat(image.PixelMapFormat.ALPHA_8).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB565_I_odd_TS_0100
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB565_I_odd_TS_0100', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800501.jpg', 'buffer', 800, 501, image.PixelMapFormat.RGB_565)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGB_565
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV12)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_RGB565_I_odd_TS_0100', pixelMap, 800, 501, image.PixelMapFormat.NV12)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB565_I_odd_TS_0200
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB565_I_odd_TS_0200', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800501.jpg', 'uri', 800, 501, image.PixelMapFormat.RGB_565)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGB_565
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV21)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_RGB565_I_odd_TS_0200', pixelMap, 800, 501, image.PixelMapFormat.NV21)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB565_I_odd_TS_0300
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB565_I_odd_TS_0300', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'rawfile', 800, 501, image.PixelMapFormat.RGB_565).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGB_565
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_8888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB565_I_odd_TS_0400
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB565_I_odd_TS_0400', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'fd', 800, 501, image.PixelMapFormat.RGB_565).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGB_565
        await pixelMap.convertPixelFormat(image.PixelMapFormat.BGRA_8888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB565_I_odd_TS_0500
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB565_I_odd_TS_0500', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'buffer', 800, 501, image.PixelMapFormat.RGB_565).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGB_565
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB565_I_odd_TS_0600
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB565_I_odd_TS_0600', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'uri', 800, 501, image.PixelMapFormat.RGB_565).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGB_565
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB565_I_odd_TS_0700
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB565_I_odd_TS_0700', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'rawfile', 800, 501, image.PixelMapFormat.RGB_565).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGB_565
        await pixelMap.convertPixelFormat(image.PixelMapFormat.UNKNOWN).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB565_I_odd_TS_0800
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB565_I_odd_TS_0800', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'fd', 800, 501, image.PixelMapFormat.RGB_565).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGB_565
        await pixelMap.convertPixelFormat(image.PixelMapFormat.ALPHA_8).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB888_I_odd_TS_0100
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB888_I_odd_TS_0100', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800501.jpg', 'buffer', 800, 501, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV12)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_RGB888_I_odd_TS_0100', pixelMap, 800, 501, image.PixelMapFormat.NV12)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB888_I_odd_TS_0200
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB888_I_odd_TS_0200', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800501.jpg', 'uri', 800, 501, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV21)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_RGB888_I_odd_TS_0200', pixelMap, 800, 501, image.PixelMapFormat.NV21)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB888_I_odd_TS_0300
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB888_I_odd_TS_0300', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'rawfile', 800, 501, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_8888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB888_I_odd_TS_0400
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB888_I_odd_TS_0400', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'fd', 800, 501, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.BGRA_8888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB888_I_odd_TS_0500
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB888_I_odd_TS_0500', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'buffer', 800, 501, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_565).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB888_I_odd_TS_0600
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB888_I_odd_TS_0600', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'uri', 800, 501, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB888_I_odd_TS_0700
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB888_I_odd_TS_0700', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'rawfile', 800, 501, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.UNKNOWN).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB888_I_odd_TS_0800
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB888_I_odd_TS_0800', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'fd', 800, 501, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.ALPHA_8).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBAF16_I_odd_TS_0100
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBAF16_I_odd_TS_0100', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800501.jpg', 'buffer', 800, 501, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV12)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_RGBAF16_I_odd_TS_0100', pixelMap, 800, 501, image.PixelMapFormat.NV12)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBAF16_I_odd_TS_0200
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBAF16_I_odd_TS_0200', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_800501.jpg', 'uri', 800, 501, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV21)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_RGBAF16_I_odd_TS_0200', pixelMap, 800, 501, image.PixelMapFormat.NV21)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBAF16_I_odd_TS_0300
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBAF16_I_odd_TS_0300', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'rawfile', 800, 501, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_8888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBAF16_I_odd_TS_0400
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBAF16_I_odd_TS_0400', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'fd', 800, 501, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.BGRA_8888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBAF16_I_odd_TS_0500
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBAF16_I_odd_TS_0500', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'buffer', 800, 501, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_565).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBAF16_I_odd_TS_0600
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBAF16_I_odd_TS_0600', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'uri', 800, 501, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBAF16_I_odd_TS_0700
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBAF16_I_odd_TS_0700', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'rawfile', 800, 501, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.UNKNOWN).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBAF16_I_odd_TS_0800
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBAF16_I_odd_TS_0800', 0, async (done: Function) => {
      await getPixelMap('JPG_800501.jpg', 'fd', 800, 501, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.ALPHA_8).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_odd_odd_TS_0100
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV12_odd_odd_TS_0100', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'buffer', 801, 501, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.NV21).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_odd_odd_TS_0200
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV12_odd_odd_TS_0200', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801501.jpg', 'uri', 801, 501, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_8888)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV12_odd_odd_TS_0200', pixelMap, 801, 501, image.PixelMapFormat.RGBA_8888)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_odd_odd_TS_0300
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV12_odd_odd_TS_0300', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801501.jpg', 'rawfile', 801, 501, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.BGRA_8888)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV12_odd_odd_TS_0300', pixelMap, 801, 501, image.PixelMapFormat.BGRA_8888)
      expect(result && resultpixelMap).assertTrue();
      done();
    })
    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_odd_odd_TS_0400
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV12_odd_odd_TS_0400', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801501.jpg', 'fd', 801, 501, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV12_odd_odd_TS_0400', pixelMap, 801, 501, image.PixelMapFormat.RGB_888)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_odd_odd_TS_0500
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV12_odd_odd_TS_0500', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801501.jpg', 'buffer', 801, 501, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_565)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV12_odd_odd_TS_0500', pixelMap, 801, 501, image.PixelMapFormat.RGB_565)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_odd_odd_TS_0600
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV12_odd_odd_TS_0600', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801501.jpg', 'uri', 801, 501, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV12_odd_odd_TS_0600', pixelMap, 801, 501, image.PixelMapFormat.RGBA_F16)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_odd_odd_TS_0700
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV12_odd_odd_TS_0700', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'rawfile', 801, 501, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.UNKNOWN).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_odd_odd_TS_0800
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV12_odd_odd_TS_0800', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'fd', 801, 501, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.ALPHA_8).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_odd_odd_TS_0100
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV21_odd_odd_TS_0100', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'buffer', 801, 501, image.PixelMapFormat.NV21).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV21
        await pixelMap.convertPixelFormat(image.PixelMapFormat.NV12).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_odd_odd_TS_0200
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV21_odd_odd_TS_0200', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801501.jpg', 'uri', 801, 501, image.PixelMapFormat.NV21)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV21
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_8888)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV21_odd_odd_TS_0200', pixelMap, 801, 501, image.PixelMapFormat.RGBA_8888)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_odd_odd_TS_0300
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV21_odd_odd_TS_0300', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801501.jpg', 'rawfile', 801, 501, image.PixelMapFormat.NV21)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV21
      await pixelMap.convertPixelFormat(image.PixelMapFormat.BGRA_8888)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV21_odd_odd_TS_0300', pixelMap, 801, 501, image.PixelMapFormat.BGRA_8888)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_odd_odd_TS_0400
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV21_odd_odd_TS_0400', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801501.jpg', 'fd', 801, 501, image.PixelMapFormat.NV21)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV21
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV21_odd_odd_TS_0400', pixelMap, 801, 501, image.PixelMapFormat.RGB_888)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_odd_odd_TS_0500
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_IMAGE_NV21_odd_odd_TS_0500', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801501.jpg', 'buffer', 801, 501, image.PixelMapFormat.NV21)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV21
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_565)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV21_odd_odd_TS_0500', pixelMap, 801, 501, image.PixelMapFormat.RGB_565)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_odd_odd_TS_0600
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV21_odd_odd_TS_0600', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801501.jpg', 'uri', 801, 501, image.PixelMapFormat.NV21)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV21
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_NV21_odd_odd_TS_0600', pixelMap, 801, 501, image.PixelMapFormat.RGBA_F16)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_odd_odd_TS_0700
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV21_odd_odd_TS_0700', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'rawfile', 801, 501, image.PixelMapFormat.NV21).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV21
        await pixelMap.convertPixelFormat(image.PixelMapFormat.UNKNOWN).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_odd_odd_TS_0800
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_NV21_odd_odd_TS_0800', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'fd', 801, 501, image.PixelMapFormat.NV21).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV21
        await pixelMap.convertPixelFormat(image.PixelMapFormat.ALPHA_8).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_odd_TS_0100
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_odd_TS_0100', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801501.jpg', 'buffer', 801, 501, image.PixelMapFormat.RGBA_8888)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGBA_8888
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV12)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_odd_TS_0100', pixelMap, 801, 501, image.PixelMapFormat.NV12)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_odd_TS_0200
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_odd_TS_0200', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801501.jpg', 'uri', 801, 501, image.PixelMapFormat.RGBA_8888)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGBA_8888
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV21)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_odd_TS_0200', pixelMap, 801, 501, image.PixelMapFormat.NV21)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_odd_TS_0300
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_odd_TS_0300', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'rawfile', 801, 501, image.PixelMapFormat.RGBA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGBA_8888
          await pixelMap.convertPixelFormat(image.PixelMapFormat.BGRA_8888).catch((err: BusinessError) => {
            expect(resultpixelMap).assertTrue();
            expect(err.code).assertEqual('62980115');
          })
        })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_odd_TS_0400
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_odd_TS_0400', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'fd', 801, 501, image.PixelMapFormat.RGBA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGBA_8888
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_odd_TS_0500
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_odd_TS_0500', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'buffer', 801, 501, image.PixelMapFormat.RGBA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGBA_8888
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_565).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_odd_TS_0600
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_odd_TS_0600', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'uri', 801, 501, image.PixelMapFormat.RGBA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGBA_8888
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_odd_TS_0700
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_odd_TS_0700', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'rawfile', 801, 501, image.PixelMapFormat.RGBA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGBA_8888
          await pixelMap.convertPixelFormat(image.PixelMapFormat.UNKNOWN).catch((err: BusinessError) => {
            expect(resultpixelMap).assertTrue();
            expect(err).assertEqual(62980115);
          })
        })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_odd_TS_0800
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBA8888_odd_odd_TS_0800', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'fd', 801, 501, image.PixelMapFormat.RGBA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGBA_8888
        await pixelMap.convertPixelFormat(image.PixelMapFormat.ALPHA_8).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_odd_TS_0100
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_odd_TS_0100', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801501.jpg', 'buffer', 801, 501, image.PixelMapFormat.BGRA_8888)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.BGRA_8888
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV12)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_odd_TS_0100', pixelMap, 801, 501, image.PixelMapFormat.NV12)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_odd_TS_0200
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_odd_TS_0200', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801501.jpg', 'uri', 801, 501, image.PixelMapFormat.BGRA_8888)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.BGRA_8888
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV21)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_odd_TS_0200', pixelMap, 801, 501, image.PixelMapFormat.NV21)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_odd_TS_0300
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_odd_TS_0300', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'rawfile', 801, 501, image.PixelMapFormat.BGRA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.BGRA_8888
          await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_8888).catch((err: BusinessError) => {
            expect(resultpixelMap).assertTrue();
            expect(err.code).assertEqual('62980115');
          })
        })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_odd_TS_0400
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_odd_TS_0400', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'fd', 801, 501, image.PixelMapFormat.BGRA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.BGRA_8888
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_odd_TS_0500
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_odd_TS_0500', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'buffer', 801, 501, image.PixelMapFormat.BGRA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.BGRA_8888
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_565).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_odd_TS_0600
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_odd_TS_0600', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'uri', 801, 501, image.PixelMapFormat.BGRA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.BGRA_8888
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_odd_TS_0700
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_odd_TS_0700', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'rawfile', 801, 501, image.PixelMapFormat.BGRA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.BGRA_8888
          await pixelMap.convertPixelFormat(image.PixelMapFormat.UNKNOWN).catch((err: BusinessError) => {
            expect(resultpixelMap).assertTrue();
            expect(err).assertEqual(62980115);
          })
        })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_odd_TS_0800
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_BGRA8888_odd_odd_TS_0800', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'fd', 801, 501, image.PixelMapFormat.BGRA_8888).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.BGRA_8888
        await pixelMap.convertPixelFormat(image.PixelMapFormat.ALPHA_8).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB565_odd_odd_TS_0100
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB565_odd_odd_TS_0100', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801501.jpg', 'buffer', 801, 501, image.PixelMapFormat.RGB_565)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGB_565
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV12)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_RGB565_odd_odd_TS_0100', pixelMap, 801, 501, image.PixelMapFormat.NV12)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB565_odd_odd_TS_0200
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB565_odd_odd_TS_0200', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801501.jpg', 'uri', 801, 501, image.PixelMapFormat.RGB_565)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGB_565
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV21)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_RGB565_odd_odd_TS_0200', pixelMap, 801, 501, image.PixelMapFormat.NV21)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB565_odd_odd_TS_0300
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB565_odd_odd_TS_0300', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'rawfile', 801, 501, image.PixelMapFormat.RGB_565).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGB_565
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_8888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB565_odd_odd_TS_0400
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB565_odd_odd_TS_0400', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'fd', 801, 501, image.PixelMapFormat.RGB_565).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGB_565
        await pixelMap.convertPixelFormat(image.PixelMapFormat.BGRA_8888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB565_odd_odd_TS_0500
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB565_odd_odd_TS_0500', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'buffer', 801, 501, image.PixelMapFormat.RGB_565).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGB_565
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB565_odd_odd_TS_0600
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB565_odd_odd_TS_0600', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'uri', 801, 501, image.PixelMapFormat.RGB_565).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGB_565
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB565_odd_odd_TS_0700
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB565_odd_odd_TS_0700', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'rawfile', 801, 501, image.PixelMapFormat.RGB_565).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGB_565
        await pixelMap.convertPixelFormat(image.PixelMapFormat.UNKNOWN).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB565_odd_odd_TS_0800
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB565_odd_odd_TS_0800', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'fd', 801, 501, image.PixelMapFormat.RGB_565).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.RGB_565
        await pixelMap.convertPixelFormat(image.PixelMapFormat.ALPHA_8).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB888_odd_odd_TS_0100
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB888_odd_odd_TS_0100', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801501.jpg', 'buffer', 801, 501, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV12)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_RGB888_odd_odd_TS_0100', pixelMap, 801, 501, image.PixelMapFormat.NV12)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB888_odd_odd_TS_0200
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB888_odd_odd_TS_0200', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801501.jpg', 'uri', 801, 501, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV21)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_RGB888_odd_odd_TS_0200', pixelMap, 801, 501, image.PixelMapFormat.NV21)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB888_odd_odd_TS_0300
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB888_odd_odd_TS_0300', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'rawfile', 801, 501, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_8888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB888_odd_odd_TS_0400
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB888_odd_odd_TS_0400', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'fd', 801, 501, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.BGRA_8888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB888_odd_odd_TS_0500
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB888_odd_odd_TS_0500', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'buffer', 801, 501, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_565).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB888_odd_odd_TS_0600
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB888_odd_odd_TS_0600', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'uri', 801, 501, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB888_odd_odd_TS_0700
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB888_odd_odd_TS_0700', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'rawfile', 801, 501, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.UNKNOWN).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGB888_odd_odd_TS_0800
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGB888_odd_odd_TS_0800', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'fd', 801, 501, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.ALPHA_8).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_odd_TS_0100
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_odd_TS_0100', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801501.jpg', 'buffer', 801, 501, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV12)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_odd_TS_0100', pixelMap, 801, 501, image.PixelMapFormat.NV12)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_odd_TS_0200
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_odd_TS_0200', 0, async (done: Function) => {
      const pixelMap: image.PixelMap = await getPixelMap('JPG_801501.jpg', 'uri', 801, 501, image.PixelMapFormat.NV12)
      const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
      await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
      await pixelMap.convertPixelFormat(image.PixelMapFormat.NV21)
      const result = await VerifyPixelMap('SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_odd_TS_0200', pixelMap, 801, 501, image.PixelMapFormat.NV21)
      expect(result && resultpixelMap).assertTrue();
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_odd_TS_0300
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_odd_TS_0300', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'rawfile', 801, 501, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_8888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_odd_TS_0400
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_odd_TS_0400', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'fd', 801, 501, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.BGRA_8888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_odd_TS_0500
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_odd_TS_0500', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'buffer', 801, 501, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_565).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_odd_TS_0600
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_odd_TS_0600', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'uri', 801, 501, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGB_888).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err.code).assertEqual('62980115');
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_odd_TS_0700
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_odd_TS_0700', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'rawfile', 801, 501, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.UNKNOWN).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })

    /*
  * @tc.number    : SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_odd_TS_0800
  * @tc.name      : convertPixelFormat
  * @tc.desc      : 1.createPixelMap,2.convertPixelFormat
  * @tc.size      : MediumTest
  * @tc.type      : Function
  * @tc.level     : Level 2
  */
    it('SUB_MULTIMEDIA_IMAGE_RGBAF16_odd_odd_TS_0800', 0, async (done: Function) => {
      await getPixelMap('JPG_801501.jpg', 'fd', 801, 501, image.PixelMapFormat.NV12).then(async (pixelMap) => {
        const resultpixelMap = pixelMap.getImageInfoSync().pixelFormat == image.PixelMapFormat.NV12
        await pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_F16)
        await pixelMap.convertPixelFormat(image.PixelMapFormat.ALPHA_8).catch((err: BusinessError) => {
          expect(resultpixelMap).assertTrue();
          expect(err).assertEqual(62980115);
        })
      })
      done();
    })
  })
}