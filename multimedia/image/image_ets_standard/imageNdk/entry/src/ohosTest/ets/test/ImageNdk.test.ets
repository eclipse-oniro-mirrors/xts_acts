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

import { describe, beforeAll, afterEach, it, expect } from '@ohos/hypium'
import ndkTest, { IImageInfo } from 'libImageNdk.so'
import image from "@ohos.multimedia.image";
import hilog from '@ohos.hilog';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import resourceManager from '@ohos.resourceManager';
import { BusinessError } from '@ohos.base';

export default function imageNdkTest() {
  describe('ImageNdkTest', () => {
    let globalpixelmap: image.PixelMap;
    let outBuffer: ArrayBuffer = new ArrayBuffer(1200000)
    let testContext: common.UIAbilityContext;
    afterEach(async () => {
      if (globalpixelmap != undefined) {
        console.info('globalpixelmap release start');
        try {
          await globalpixelmap.release();
        } catch (error) {
          console.info('globalpixelmap release fail');
        }
      }
      console.info('afterEach case');
    })

    beforeAll(async () => {
      filesDir = AppStorage.get('pathDir')
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
    })

    let filePath: string;
    let fileFd: number;
    let buffer: ArrayBuffer;
    let filesDir: string | undefined

    const getFd = async (fileName: string) => {
      filePath = filesDir + '/' + fileName;
      console.log('filePath:', filePath)
      let file = fs.openSync(filePath);
      fileFd = file.fd;
    }

    const getBuffer = async (fileName: string) => {
      filePath = filesDir + '/' + fileName;
      console.log('filePath:', filePath)
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead)
      buffer = bufferRead
    }

    const NDK_CreatePixelMap = async (TAG: string, type:string, filename: string, width: number, height: number,done:Function) => {
      try {
        await getFd(filename);
        let imageSourceApi: image.ImageSource = ndkTest.CreateFromUri(filePath);
        if (type === 'Fd') {
          imageSourceApi = ndkTest.CreateFromFd(fileFd);
        }
        if (type === 'Buffer') {
          await getBuffer(filename);
          imageSourceApi = ndkTest.CreateFromData(buffer);
        }
        if (type === 'RawFile') {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `type = rawfile`)
          const resourceMgr: resourceManager.ResourceManager = testContext.createModuleContext("entry").resourceManager;
          let rawFileDescriptor: resourceManager.RawFileDescriptor = await resourceMgr.getRawFd(filename);
          let imageSourceApi: image.ImageSource = ndkTest.CreateFromRawFile(rawFileDescriptor.fd,
            rawFileDescriptor.offset, rawFileDescriptor.length);
        }
        if (typeof imageSourceApi === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
          const pixelMap:image.PixelMap | number = ndkTest.CreatePixelMap(imageSourceApi)
          if (typeof pixelMap === "object") {
            let result: boolean = false;
            hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap success :${pixelMap}`)

            const pixelMapInfo = ndkTest.testGetImageInfo();
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' imageInfo :' + JSON.stringify(pixelMapInfo));
            let desiredPixelFormat: number = 3
            let alphaType: number = 0
            if (pixelMapInfo.pixelFormat === desiredPixelFormat &&
              pixelMapInfo.width === width &&
              pixelMapInfo.height === height &&
              pixelMapInfo.alphaType === alphaType) {
              result = true
            }
            expect(result).assertTrue();
            ndkTest.SourceRelease(imageSourceApi);
            ndkTest.PixelMapRelease(pixelMap);
            done()
          } else {
            hilog.info(0x0000, 'scaleTest', '%{public}s',TAG + `pixelMap failed: ${pixelMap}`)
            ndkTest.SourceRelease(imageSourceApi)
            expect(false).assertTrue();
            done()
          }
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        console.error(TAG + "Test exception " + error);
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_CreateFromUri = async (TAG: string, filename: string, done: Function) => {
      hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `ndkTest： ` + JSON.stringify(ndkTest))
      await getFd(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromUri(filePath)
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        expect(true).assertTrue();
        ndkTest.SourceRelease(imageSourceApi);
        done();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed:${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_CreateFromFd = async (TAG: string, filename: string, done: Function) => {
      hilog.info(0x0000, 'scaleTest', '%{public}s', `ndkTest： ` + JSON.stringify(ndkTest))
      await getFd(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromFd(fileFd);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        expect(true).assertTrue();
        ndkTest.SourceRelease(imageSourceApi);
        done();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed:${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_CreateFromData = async (TAG: string, filename: string, done: Function) => {
      hilog.info(0x0000, 'scaleTest', '%{public}s', `ndkTest： ` + JSON.stringify(ndkTest))
      await getBuffer(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromData(buffer);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        expect(true).assertTrue();
        ndkTest.SourceRelease(imageSourceApi);
        done();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed:${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_CreatePixelMapByUri = async (TAG: string, index: number, rotate: number, x: number, y: number,
                                           Regionwidth: number, RegionHeight: number, width: number, height: number,
                                           desiredPixelFormat: number, filename: string, done: Function) => {
      await getFd(filename);
      console.log('-------------------- NDK' + ndkTest)
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromUri(filePath);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetPixelFormat(options, desiredPixelFormat);
        ndkTest.DecodingOptionsSetIndex(options, index);
        ndkTest.DecodingOptionsSetRotate(options, rotate);
        ndkTest.DecodingOptionsSetDesiredSize(options, width, height);
        ndkTest.DecodingOptionsSetDesiredRegion(options, x, y, Regionwidth, RegionHeight);
        const pixelMap: image.PixelMap | number = ndkTest.CreatePixelMap(imageSourceApi, options)
        if (typeof pixelMap === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap success :${pixelMap}`)
          expect(true).assertTrue();
          ndkTest.SourceRelease(imageSourceApi);
          ndkTest.PixelMapRelease(pixelMap);
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap failed: ${pixelMap}`)
          ndkTest.SourceRelease(imageSourceApi)
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_CreatePixelMapByFd = async (TAG: string, index: number, rotate: number, x: number, y: number,
                                          Regionwidth: number, RegionHeight: number, width: number, height: number,
                                          desiredPixelFormat: number, filename: string, done: Function) => {
      await getFd(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromFd(fileFd);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetPixelFormat(options, desiredPixelFormat);
        ndkTest.DecodingOptionsSetIndex(options, index);
        ndkTest.DecodingOptionsSetRotate(options, rotate);
        ndkTest.DecodingOptionsSetDesiredSize(options, width, height);
        ndkTest.DecodingOptionsSetDesiredRegion(options, x, y, Regionwidth, RegionHeight);
        const pixelMap: image.PixelMap | number = ndkTest.CreatePixelMap(imageSourceApi, options)
        if (typeof pixelMap === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap success :${pixelMap}`)
          expect(true).assertTrue();
          ndkTest.SourceRelease(imageSourceApi)
          ndkTest.PixelMapRelease(pixelMap);
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap failed: ${pixelMap}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_CreatePixelMapByData = async (TAG: string, index: number, rotate: number, x: number, y: number,
                                            Regionwidth: number, RegionHeight: number, width: number, height: number,
                                            desiredPixelFormat: number, filename: string, done: Function) => {
      await getBuffer(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromData(buffer);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetPixelFormat(options, desiredPixelFormat);
        ndkTest.DecodingOptionsSetIndex(options, index);
        ndkTest.DecodingOptionsSetRotate(options, rotate);
        ndkTest.DecodingOptionsSetDesiredSize(options, width, height);
        ndkTest.DecodingOptionsSetDesiredRegion(options, x, y, Regionwidth, RegionHeight);
        const pixelMap: image.PixelMap | number = ndkTest.CreatePixelMap(imageSourceApi, options)
        if (typeof pixelMap === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap success :${pixelMap}`)
          expect(true).assertTrue();
          ndkTest.SourceRelease(imageSourceApi);
          ndkTest.PixelMapRelease(pixelMap);
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap failed: ${pixelMap}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }


    const NDK_CreatePixelMapListByUri = async (TAG: string, index: number, rotate: number, x: number, y: number,
                                               Regionwidth: number, RegionHeight: number, width: number, height: number,
                                               desiredPixelFormat: number, filename: string, done: Function) => {
      await getFd(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromUri(filePath);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetPixelFormat(options, desiredPixelFormat);
        ndkTest.DecodingOptionsSetIndex(options, index);
        ndkTest.DecodingOptionsSetRotate(options, rotate);
        ndkTest.DecodingOptionsSetDesiredSize(options, width, height);
        ndkTest.DecodingOptionsSetDesiredRegion(options, x, y, Regionwidth, RegionHeight);
        const pixelMapList: Array<image.PixelMap> | number = ndkTest.CreatePixelMapList(imageSourceApi, options)
        if (Array.isArray(pixelMapList)) {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMapList success :${pixelMapList}`)
          expect(true).assertTrue();
          ndkTest.SourceRelease(imageSourceApi);
          pixelMapList.forEach(pixelMap => {
            ndkTest.PixelMapRelease(pixelMap);
          });
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMapList failed: ${pixelMapList}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_CreatePixelMapListByFd = async (TAG: string, index: number, rotate: number, x: number, y: number,
                                              Regionwidth: number, RegionHeight: number, width: number, height: number,
                                              desiredPixelFormat: number, filename: string, done: Function) => {
      await getFd(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromFd(fileFd);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetPixelFormat(options, desiredPixelFormat);
        ndkTest.DecodingOptionsSetIndex(options, index);
        ndkTest.DecodingOptionsSetRotate(options, rotate);
        ndkTest.DecodingOptionsSetDesiredSize(options, width, height);
        ndkTest.DecodingOptionsSetDesiredRegion(options, x, y, Regionwidth, RegionHeight);
        const pixelMapList: Array<image.PixelMap> | number = ndkTest.CreatePixelMapList(imageSourceApi, options)
        if (Array.isArray(pixelMapList)) {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMapList success :${pixelMapList}`)
          expect(true).assertTrue();
          ndkTest.SourceRelease(imageSourceApi);
          pixelMapList.forEach(pixelMap => {
            ndkTest.PixelMapRelease(pixelMap);
          });
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMapList failed: ${pixelMapList}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_CreatePixelMapListByData = async (TAG: string, index: number, rotate: number, x: number, y: number,
                                                Regionwidth: number, RegionHeight: number, width: number, height: number,
                                                desiredPixelFormat: number, filename: string, done: Function) => {
      await getBuffer(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromData(buffer);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetPixelFormat(options, desiredPixelFormat);
        ndkTest.DecodingOptionsSetIndex(options, index);
        ndkTest.DecodingOptionsSetRotate(options, rotate);
        ndkTest.DecodingOptionsSetDesiredSize(options, width, height);
        ndkTest.DecodingOptionsSetDesiredRegion(options, x, y, Regionwidth, RegionHeight);
        const pixelMapList: Array<image.PixelMap> | number = ndkTest.CreatePixelMapList(imageSourceApi, options)
        if (Array.isArray(pixelMapList)) {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMapList success :${pixelMapList}`)
          expect(true).assertTrue();
          ndkTest.SourceRelease(imageSourceApi);
          pixelMapList.forEach(pixelMap => {
            ndkTest.PixelMapRelease(pixelMap);
          });
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMapList failed: ${pixelMapList}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }


    const NDK_GetDelayTime = async (TAG: string, filename: string, type: string, done: Function) => {
      await getFd(filename);
      let imageSourceApi: image.ImageSource = ndkTest.CreateFromUri(filePath);

      if (type === 'Fd') {
        imageSourceApi = ndkTest.CreateFromFd(fileFd);
      }
      if (type === 'Buffer') {
        await getBuffer(filename);
        imageSourceApi = ndkTest.CreateFromData(buffer);
      }
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        const delayTime: Array<number> | number = ndkTest.GetDelayTime(imageSourceApi)
        if (Array.isArray(delayTime)) {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `delayTime success:${delayTime}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(true).assertTrue();
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `delayTime failed: ${delayTime}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed: ${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_GetImageInfoByUri = async (TAG: string, index: number, filename: string, done: Function) => {
      await getFd(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromUri(filePath);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        const imageInfo: image.ImageInfo | number = ndkTest.GetImageInfo(imageSourceApi, index)
        if (typeof imageInfo === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imageInfo success: ${imageInfo}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(true).assertTrue();
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imageInfo failed: ${imageInfo}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed:${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_GetImageInfoByFd = async (TAG: string, index: number, filename: string, done: Function) => {
      await getFd(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromFd(fileFd);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        const imageInfo: image.ImageInfo | number = ndkTest.GetImageInfo(imageSourceApi, index)
        if (typeof imageInfo === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imageInfo success: ${imageInfo}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(true).assertTrue();
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imageInfo failed: ${imageInfo}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed:${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_GetImageInfoByData = async (TAG: string, index: number, filename: string, done: Function) => {
      await getBuffer(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromData(buffer);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        const imageInfo: image.ImageInfo | number = ndkTest.GetImageInfo(imageSourceApi, index)
        if (typeof imageInfo === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imageInfo success: ${imageInfo}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(true).assertTrue();
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imageInfo failed: ${imageInfo}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed:${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_GetImageProperty = async (TAG: string, filename: string, type: string, done: Function) => {
      let key = image.PropertyKey.SCENE_TYPE;
      await getFd(filename);
      let imageSourceApi: image.ImageSource = ndkTest.CreateFromUri(filePath);
      if (type === 'Fd') {
        imageSourceApi = ndkTest.CreateFromFd(fileFd);
      }
      const imagePropertyRes: String | number = ndkTest.GetImageProperty(imageSourceApi, key);
      if (typeof imagePropertyRes === "string") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imageInfo success: ${imagePropertyRes}`)
        ndkTest.SourceRelease(imageSourceApi);
        expect(true).assertTrue();
        done()
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imageInfo failed: ${imagePropertyRes}`)
        ndkTest.SourceRelease(imageSourceApi);
        expect(false).assertTrue();
        done()
      }
    }

    const NDK_ModifyImagePropertyByUri = async (TAG: string, filename: string, done: Function) => {
      await getFd(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromUri(filePath);
      let propertyModifyRes: Number = ndkTest.ModifyImageProperty(imageSourceApi, image.PropertyKey.ORIENTATION, "4");
      if (propertyModifyRes === 0) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imagePropertyRes success:` +
        JSON.stringify(propertyModifyRes))
        ndkTest.SourceRelease(imageSourceApi);
        expect(true).assertTrue();
        done();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imagePropertyRes failed:` +
        JSON.stringify(propertyModifyRes))
        ndkTest.SourceRelease(imageSourceApi);
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_ModifyImagePropertyByFd = async (TAG: string, filename: string, done: Function) => {
      await getFd(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromFd(fileFd);
      let propertyModifyRes: Number = ndkTest.ModifyImageProperty(imageSourceApi, image.PropertyKey.ORIENTATION, "4");
      if (propertyModifyRes === 0) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imagePropertyRes success:` +
        JSON.stringify(propertyModifyRes))
        ndkTest.SourceRelease(imageSourceApi);
        expect(true).assertTrue();
        done();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imagePropertyRes failed:` +
        JSON.stringify(propertyModifyRes))
        ndkTest.SourceRelease(imageSourceApi);
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_GetFrameCount = async (TAG: string, filename: string, type: string, done: Function) => {

      await getFd(filename);
      let imageSourceApi: image.ImageSource = ndkTest.CreateFromUri(filePath);
      if (type === 'Fd') {
        imageSourceApi = ndkTest.CreateFromFd(fileFd);
      }
      if (type === 'Buffer') {
        await getBuffer(filename);
        imageSourceApi = ndkTest.CreateFromData(buffer);
      }
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        const frameCount: Array<number> = ndkTest.GetFrameCount(imageSourceApi)
        ndkTest.SourceRelease(imageSourceApi);
        if (Object.values(frameCount)[1] === 0) {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `frameCount success: ${Object.values(frameCount)[1]}`)
          expect(true).assertTrue();
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `frameCount failed: ${Object.values(frameCount)[1]}`)
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed: ${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_SourceRelease = async (TAG: string, filename: string, type: string, done: Function) => {
      await getFd(filename);
      let imageSourceApi: image.ImageSource = ndkTest.CreateFromUri(filePath);
      if (type === 'Fd') {
        imageSourceApi = ndkTest.CreateFromFd(fileFd);
      }
      if (type === 'Buffer') {
        await getBuffer(filename);
        imageSourceApi = ndkTest.CreateFromData(buffer);
      }
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        const release = ndkTest.SourceRelease(imageSourceApi)
        if (release === 0) {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `release success ${release}`)
          expect(true).assertTrue();
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `release failed: ${release}`)
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed: ${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_GetImageInfoByOption = async (TAG: string, index: number, rotate: number, x: number, y: number,
                                            Regionwidth: number, RegionHeight: number, width: number, height: number,
                                            desiredPixelFormat: number, done: Function) => {
      let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
      ndkTest.DecodingOptionsSetPixelFormat(options, desiredPixelFormat);
      ndkTest.DecodingOptionsSetIndex(options, index);
      ndkTest.DecodingOptionsSetRotate(options, rotate);
      ndkTest.DecodingOptionsSetDesiredSize(options, width, height);
      ndkTest.DecodingOptionsSetDesiredRegion(options, x, y, Regionwidth, RegionHeight);
      hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `set DecodingOptions success:${options}`)
      const targetFromat: Number = ndkTest.DecodingOptionsGetPixelFormat(options);
      if (targetFromat === desiredPixelFormat) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsFormat success:${targetFromat}`)
        expect(true).assertTrue();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsFormat failed:${targetFromat}`)
        expect(false).assertTrue();
      }

      const targetIndex: number = ndkTest.DecodingOptionsGetIndex(options);
      if (targetIndex === index) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsIndex success:${targetIndex}`)
        expect(true).assertTrue();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsIndex failed:${targetIndex}`)
        expect(false).assertTrue();
      }

      const targetRotate: number = ndkTest.DecodingOptionsGetRotate(options);
      if (targetRotate === rotate) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsRotate success:${targetRotate}`)
        expect(true).assertTrue();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsRotate failed:${targetRotate}`)
        expect(false).assertTrue();
      }

      const targetSize: image.Size = ndkTest.DecodingOptionsGetDesiredSize(options);
      if (Object.values(targetSize)[0] === width) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsWidth success`);
        expect(true).assertTrue();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsWidth failed`)
        expect(false).assertTrue();
      }
      if (Object.values(targetSize)[1] === height) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsHeight success`)
        expect(true).assertTrue();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsHeight failed`)
        expect(false).assertTrue();
      }

      const targetRegion: image.Region = ndkTest.DecodingOptionsGetDesiredRegion(options);
      if (Object.values(targetRegion)[0] === x) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsX success`)
        expect(true).assertTrue();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsX failed`)
        expect(false).assertTrue();
      }
      if (Object.values(targetRegion)[1] === y) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsY success`)
        expect(true).assertTrue();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsY failed`)
        expect(false).assertTrue();
      }
      if (Object.values(targetRegion)[2] === Regionwidth) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsRegionwidth success`)
        expect(true).assertTrue();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsRegionwidth failed`)
        expect(false).assertTrue();
      }
      if (Object.values(targetRegion)[3] === RegionHeight) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsRegionHeight success`)
        expect(true).assertTrue();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsRegionHeight failed`)
        expect(false).assertTrue();
      }
      done();
    }

    const NDK_CreateFromRawFile = async (TAG: string, filename: string, done: Function) => {
      const resourceMgr: resourceManager.ResourceManager = testContext.createModuleContext("entry").resourceManager;
      resourceMgr.getRawFd(filename).then((rawFileDescriptor: resourceManager.RawFileDescriptor) => {
        let imageSourceApi: image.ImageSource = ndkTest.CreateFromRawFile(rawFileDescriptor.fd,
          rawFileDescriptor.offset, rawFileDescriptor.length);
        if (typeof imageSourceApi === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
          expect(true).assertTrue();
          done();
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed:${imageSourceApi}`)
          expect(false).assertTrue();
          done();
        }
      }).catch((error: BusinessError) => {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source error: ${error.code}`)
        expect(false).assertTrue();
        done()
      })
    }

    const NDK_CreatePixelMapByRawFile = async (TAG: string, index: number, rotate: number, x: number, y: number, Regionwidth: number,
                                               RegionHeight: number, width: number, height: number, desiredPixelFormat: number,
                                               filename: string, done: Function) => {
      const resourceMgr: resourceManager.ResourceManager = testContext.createModuleContext("entry").resourceManager;
      const rawFileDescriptor: resourceManager.RawFileDescriptor = await resourceMgr.getRawFd(filename)
      let imageSourceApi: image.ImageSource = ndkTest.CreateFromRawFile(rawFileDescriptor.fd,
        rawFileDescriptor.offset, rawFileDescriptor.length);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetPixelFormat(options, desiredPixelFormat);
        ndkTest.DecodingOptionsSetIndex(options, index);
        ndkTest.DecodingOptionsSetRotate(options, rotate);
        ndkTest.DecodingOptionsSetDesiredSize(options, width, height);
        ndkTest.DecodingOptionsSetDesiredRegion(options, x, y, Regionwidth, RegionHeight);
        const pixelMap = ndkTest.CreatePixelMap(imageSourceApi, options)
        if (typeof pixelMap === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap success :${pixelMap}`)
          expect(true).assertTrue();
          ndkTest.SourceRelease(imageSourceApi);
          ndkTest.PixelMapRelease(pixelMap);
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap failed: ${pixelMap}`)
          ndkTest.SourceRelease(imageSourceApi)
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_CreatePixelMapListByRawFile = async (TAG: string, index: number, rotate: number, x: number, y: number,
                                                   Regionwidth: number, RegionHeight: number, width: number, height: number,
                                                   desiredPixelFormat: number, filename: string, done: Function) => {
      const resourceMgr: resourceManager.ResourceManager = testContext.createModuleContext("entry").resourceManager;
      const rawFileDescriptor: resourceManager.RawFileDescriptor = await resourceMgr.getRawFd(filename)
      let imageSourceApi: image.ImageSource = ndkTest.CreateFromRawFile(rawFileDescriptor.fd,
        rawFileDescriptor.offset, rawFileDescriptor.length);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetPixelFormat(options, desiredPixelFormat);
        ndkTest.DecodingOptionsSetIndex(options, index);
        ndkTest.DecodingOptionsSetRotate(options, rotate);
        ndkTest.DecodingOptionsSetDesiredSize(options, width, height);
        ndkTest.DecodingOptionsSetDesiredRegion(options, x, y, Regionwidth, RegionHeight);
        const pixelMapList = ndkTest.CreatePixelMapList(imageSourceApi, options)
        if (Array.isArray(pixelMapList)) {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMapList success :${pixelMapList}`)
          expect(true).assertTrue();
          ndkTest.SourceRelease(imageSourceApi);
          pixelMapList.forEach((pixelMap) => {
            ndkTest.PixelMapRelease(pixelMap);
          });
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMapList failed: ${pixelMapList}`)
          expect(false).assertTrue();
          ndkTest.SourceRelease(imageSourceApi);
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const compResult = (res: Number, done: Function) => {
      if (res === -1 || res === 62980115 || res === 1) {
        expect(false).assertTrue();
        done()
      } else {
        expect(true).assertTrue();
        done()
      }
    }

    const compResultC = (res: Number, done: Function) => {

      if (res !== 0) {
        expect(true).assertTrue();
        done()
      } else {
        expect(false).assertTrue();
        done()
      }
    }

    const closeFile = (fileFd: number) => {
      try {
        fs.closeSync(fileFd)
      } catch (e) {
        console.log("close failed FD ", fileFd)

      }
    }


    const NDK_Packer = async (TAG: string, filename: string, done: Function, apiType: string, dataSource: string,
                              quality: number, mimeType: string, counterExample: boolean): Promise<void> => {

      hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} start`)
      const parker: image.ImagePacker = ndkTest.PackerCreate()
      hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} create packer `)
      if (parker) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} create packer success`)
        await getFd(filename);
        hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} getFd`)
        const imageSourceApi: image.ImageSource = ndkTest.CreateFromFd(fileFd);
        hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} imageSource ${imageSourceApi}`)
        if (imageSourceApi) {
          let packOpts: image.PackingOption = ndkTest.CreatePackingOptions()
          hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} createPackOpts ${imageSourceApi}`)
          const resQuality: number = ndkTest.PackingOptionsSetQuality(packOpts, quality)
          const resMimeType: number = ndkTest.PackingOptionsSetMimeType(packOpts, mimeType)
          ndkTest.PackingOptionsSetNeedsPackProperties(packOpts, 1)
          hilog.info(0x0000, 'scaleTest', '%{public}s', ` ${TAG} res1 res2 test ${resQuality} ${resMimeType}`)
          let res: number
          if (resQuality && resMimeType) {
            expect(false).assertTrue();
          }
          if (dataSource === "pixelMap") {
            const imagesource: image.ImageSource = ndkTest.CreateFromFd(fileFd)
            hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} imageSource ${imagesource}`)
            const DecodingOptions: image.DecodingOptions = ndkTest.CreateDecodingOptions()
            const pixelMap: image.PixelMap | number = ndkTest.CreatePixelMap(imagesource, DecodingOptions)
            hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} pixelMap ${pixelMap}`)
            hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} packOpts ${packOpts}`)
            hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} parker ${parker}`)
            if (apiType === "packing") {
              hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} PackToDataFromPixelMap`)
              res = ndkTest.PackToDataFromPixelMap(parker, packOpts, pixelMap, outBuffer)
              hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} PackToDataFromPixelMap ${res}`)
            } else {
              hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} .PackToFileFromPixelMap`)
              res = ndkTest.PackToFileFromPixelMap(parker, packOpts, pixelMap, fileFd)
              hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} .PackToFileFromPixelMap ${res}`)
            }
            hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} 444 `)
          } else {
            if (apiType === "packing") {
              hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} PackToDataFromImageSource`)
              res = ndkTest.PackToDataFromImageSource(parker, packOpts, imageSourceApi, outBuffer)
              hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} PackToDataFromImageSource res  ${res}`)
            } else {
              hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} PackToFileFromImageSource`)
              res = ndkTest.PackToFileFromImageSource(parker, packOpts, imageSourceApi, fileFd)
              hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} PackToFileFromImageSource ${res}`)
            }
          }
          closeFile(fileFd)
          hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} packresult ${res}`)
          if (counterExample) {
            return compResultC(res, done)
          }
          return compResult(res, done)
        } else {
          closeFile(fileFd)
          hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} failed `)
          expect().assertFail()
          done()
        }
      } else {
        closeFile(fileFd)
        expect().assertFail()
        done();
      }
    }

    const CreatePixelMapByHdr = async (TAG: string, done: Function) => {
      await getBuffer("text.jpg");
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromData(buffer);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetDesiredDynamicRange(options, 2);
        const pixelMap: image.PixelMap | number = ndkTest.CreatePixelMap(imageSourceApi, options)
        if (typeof pixelMap === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap success :${pixelMap}`)
          let pixelmapDynamic: number = ndkTest.GetPixelMapDynamicRange(pixelMap);
          if (pixelmapDynamic != 0) {
            hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `CreatePixelMapByHdr pixelmapDynamic is not zero`)
            expect(false).assertTrue();
            done();
          } else {
            hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `CreatePixelMapByHdr pixelmapDynamic is zero`)
            expect(true).assertTrue();
            ndkTest.SourceRelease(imageSourceApi);
            ndkTest.PixelMapRelease(pixelMap);
            done()
          }
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap failed: ${pixelMap}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const PixelMapToSdr = async (TAG: string, done: Function) => {
      await getBuffer("text.jpg");
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromData(buffer);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetDesiredDynamicRange(options, 2);
        const pixelMap: image.PixelMap | number = ndkTest.CreatePixelMap(imageSourceApi, options)
        if (typeof pixelMap === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap success :${pixelMap}`)
          let pixelmapDynamic: number = ndkTest.GetPixelMapDynamicRange(pixelMap);
          if (pixelmapDynamic != 0) {
            hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `PixelMapToSdr pixelmapDynamic is not zero`)
            expect(false).assertTrue();
            done();
          } else {
            hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `PixelMapToSdr pixelmapDynamic is zero`)
            expect(true).assertTrue();
            let res:number = ndkTest.PixelMapToSdr(pixelMap);
            expect(res == 0).assertTrue();
            ndkTest.SourceRelease(imageSourceApi);
            ndkTest.PixelMapRelease(pixelMap);
            done()
          }
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap failed: ${pixelMap}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const DecodingOptionsDesiredDynamic = async (TAG: string, desiredDynamicRange: number, done: Function) => {
      let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
      ndkTest.DecodingOptionsSetDesiredDynamicRange(options, desiredDynamicRange);

      const targetDynamic: number = ndkTest.DecodingOptionsGetDesiredDynamicRange(options);
      if (targetDynamic === desiredDynamicRange) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get desiredDynamicRange success:${targetDynamic}`)
        expect(true).assertTrue();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get desiredDynamicRange failed:${targetDynamic}`)
        expect(false).assertTrue();
      }
      done();
    }

    const PackingOptionsDesiredDynamic = async (TAG: string, desiredDynamicRange: number, done: Function) => {
      let options: image.PackingOption = ndkTest.CreatePackingOptions();
      ndkTest.PackingOptionsSetDesiredDynamicRange(options, desiredDynamicRange);

      const targetDynamic: number = ndkTest.PackingOptionsGetDesiredDynamicRange(options);
      if (targetDynamic === desiredDynamicRange) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get desiredDynamicRange success:${targetDynamic}`)
        expect(true).assertTrue();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get desiredDynamicRange failed:${targetDynamic}`)
        expect(false).assertTrue();
      }
      done();
    }

    const PackingOptionsNeedsPackProperties = async (TAG: string, needsPackProperties: number, done: Function) => {
      let options: image.PackingOption = ndkTest.CreatePackingOptions();
      ndkTest.PackingOptionsSetNeedsPackProperties(options, needsPackProperties);

      const target: number = ndkTest.PackingOptionsGetNeedsPackProperties(options);
      if (needsPackProperties === target) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get needsPackProperties success:${target}`)
        expect(true).assertTrue();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get needsPackProperties failed:${target}`)
        expect(false).assertTrue();
      }
      done();
    }

    const CheckImageSourceDynamicRange = async (TAG: string, done: Function) => {
      await getBuffer("test.jpg");
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromData(buffer);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let sourceDynamic:number = ndkTest.GetImageSourceDynamicRange(imageSourceApi);
        if (sourceDynamic != 0) {
          expect(true).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NATIVE_RegionDecode = async (TAG: string, RegionX: number, RegionY: number,
                                          RegionWidth: number, RegionHeight: number, desiredWidth: number, desiredHeight: number,
                                          filename: string, done: Function, cropStrategy?: number) => {
      await getFd(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromFd(fileFd);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'Native_RegionDecodeTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetDesiredSize(options, desiredWidth, desiredHeight);
        ndkTest.DecodingOptionsSetDesiredRegion(options, RegionX, RegionY, RegionWidth, RegionHeight);
        if (cropStrategy != undefined) {
          ndkTest.DecodingOptionsGetIndex(options);
          ndkTest.DecodingOptionsSetCropAndScaleStrategy(options, cropStrategy);
          const targetCropStrategy: number = ndkTest.DecodingOptionsGetCropAndScaleStrategy(options);
          expect(targetCropStrategy == cropStrategy).assertTrue();
        }
      const pixelMap: image.PixelMap | number = ndkTest.CreatePixelMap(imageSourceApi, options)
      if (typeof pixelMap === "object") {
        expect(true).assertTrue();
        ndkTest.SourceRelease(imageSourceApi)
        ndkTest.PixelMapRelease(pixelMap);
        done()
      } else {
        ndkTest.SourceRelease(imageSourceApi);
        expect(false).assertTrue();
        done()
      }
    } else {
        expect(false).assertTrue();
        done()
    }
  }

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_InitializationOptions_0100
     * @tc.name      : testInitializationOptions
     * @tc.desc      : 1.testInitializationOptions
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_InitializationOptions_0100', 0, (done: Function) => {
      let result: number = ndkTest.testInitializationOptions(6, 4, 3, 0)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_InitializationOptions_0200
     * @tc.name      : testInitializationOptions
     * @tc.desc      : 1.testInitializationOptions
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_InitializationOptions_0200', 0, (done: Function) => {
      let result: number = ndkTest.testInitializationOptions(6, 4, 3, 1)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_InitializationOptions_0300
     * @tc.name      : testInitializationOptions
     * @tc.desc      : 1.testInitializationOptions
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_InitializationOptions_0300', 0, (done: Function) => {
      let result: number = ndkTest.testInitializationOptions(6, 4, 3, 2)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_InitializationOptions_0400
     * @tc.name      : testInitializationOptions
     * @tc.desc      : 1.testInitializationOptions
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_InitializationOptions_0400', 0, (done: Function) => {
      let result: number = ndkTest.testInitializationOptions(6, 4, 3, 3)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0100
     * @tc.name      : testCreatePixelmap
     * @tc.desc      : 1.testCreatePixelmap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0100', 0, (done: Function) => {
      let result: number = ndkTest.testCreatePixelmap(6, 4, 3, 0)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0200
     * @tc.name      : testCreatePixelmap
     * @tc.desc      : 1.testCreatePixelmap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0200', 0, (done: Function) => {
      let result: number = ndkTest.testCreatePixelmap(6, 4, 3, 1)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0300
     * @tc.name      : testCreatePixelmap
     * @tc.desc      : 1.testCreatePixelmap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0300', 0, (done: Function) => {
      let result: number = ndkTest.testCreatePixelmap(6, 4, 3, 2)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0400
     * @tc.name      : testCreatePixelmap
     * @tc.desc      : 1.testCreatePixelmap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0400', 0, (done: Function) => {
      let result: number = ndkTest.testCreatePixelmap(6, 4, 3, 3)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0500
     * @tc.name      : testCreatePixelmap
     * @tc.desc      : 1.testCreatePixelmap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0500', 0, (done: Function) => {
      let result: number = ndkTest.testCreatePixelmap(6, 4, 4, 0)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0600
     * @tc.name      : testCreatePixelmap
     * @tc.desc      : 1.testCreatePixelmap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0600', 0, (done: Function) => {
      let result: number = ndkTest.testCreatePixelmap(6, 4, 4, 1)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0700
     * @tc.name      : testICreatePixelmap
     * @tc.desc      : 1.testCreatePixelmap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0700', 0, (done: Function) => {
      let result: number = ndkTest.testCreatePixelmap(6, 4, 4, 2)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0800
     * @tc.name      : testICreatePixelmap
     * @tc.desc      : 1.testCreatePixelmap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0800', 0, (done: Function) => {
      let result: number = ndkTest.testCreatePixelmap(6, 4, 4, 3)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_ReadPixels_0100
     * @tc.name      : testReadPixels
     * @tc.desc      : 1.testReadPixels
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_ReadPixels_0100', 0, (done: Function) => {
      let pixelmapResult: number = ndkTest.testCreatePixelmap(6, 4, 3, 1)
      expect(pixelmapResult).assertEqual(0)
      let readBuffer = new ArrayBuffer(96);
      let result: number = ndkTest.testReadPixels(readBuffer)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_WritePixels_0100
     * @tc.name      : testWritePixels
     * @tc.desc      : 1.testWritePixels
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_WritePixels_0100', 0, (done: Function) => {
      let resultPixelmap: number = ndkTest.testCreatePixelmap(6, 4, 3, 1)
      expect(resultPixelmap).assertEqual(0)
      let color = new ArrayBuffer(96);
      let bufferArr = new Uint8Array(color);
      for (let i = 0; i < bufferArr.length; i++) {
        bufferArr[i] = i + 1;
      }
      let result: number = ndkTest.testWritePixels(color)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_GetImageInfo_0100
     * @tc.name      : testGetImageInfo
     * @tc.desc      : 1.testGetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_GetImageInfo_0100', 0, (done: Function) => {
      let resultPixelmap: number = ndkTest.testCreatePixelmap(6, 4, 3, 1)
      expect(resultPixelmap).assertEqual(0)
      let imageInfo: IImageInfo = ndkTest.testGetImageInfo()
      hilog.info(0x0000, 'testTag', '%{public}s', `imageInfo:${JSON.stringify(imageInfo)}`);
      expect(imageInfo).not().assertNull();
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_Opacity_0100
     * @tc.name      : testOpacity
     * @tc.desc      : 1.testOpacity
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_Opacity_0100', 0, (done: Function) => {
      let resultPixelmap: number = ndkTest.testCreatePixelmap(6, 4, 3, 1)
      expect(resultPixelmap).assertEqual(0)
      let result: number = ndkTest.testOpacity(90)
      expect(result).assertEqual(0)
      done();
    })

    /*
    * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_Scale_0100
    * @tc.name      : testScale
    * @tc.desc      : 1.testScale
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_Scale_0100', 0, (done: Function) => {
      let resultPixelmap: number = ndkTest.testCreatePixelmap(6, 4, 3, 1)
      expect(resultPixelmap).assertEqual(0)
      let result: number = ndkTest.testScale(100, 100)
      expect(result).assertEqual(0)
      done();
    })

    /*
    * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_Translate_0100
    * @tc.name      : testTranslate
    * @tc.desc      : 1.testTranslate
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_Translate_0100', 0, (done: Function) => {
      let resultPixelmap: number = ndkTest.testCreatePixelmap(6, 4, 3, 1)
      expect(resultPixelmap).assertEqual(0)
      let result: number = ndkTest.testTranslate(100, 100)
      expect(result).assertEqual(0)
      done();
    })

    /*
    * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_Rotate_0100
    * @tc.name      : testRotate
    * @tc.desc      : 1.testRotate
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_Rotate_0100', 0, (done: Function) => {
      let resultPixelmap: number = ndkTest.testCreatePixelmap(6, 4, 3, 1)
      expect(resultPixelmap).assertEqual(0)
      let result: number = ndkTest.testRotate(90.0)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_Flip_0100
     * @tc.name      : testFlip
     * @tc.desc      : 1.testFlip
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_Flip_0100', 0, (done: Function) => {
      let resultPixelmap: number = ndkTest.testCreatePixelmap(6, 4, 3, 1)
      expect(resultPixelmap).assertEqual(0)
      let result: number = ndkTest.testFlip(true, true)
      expect(result).assertEqual(0)
      done();
    })

    /*
   * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_Crop_0100
   * @tc.name      : testCrop
   * @tc.desc      : 1.testCrop
   * @tc.size      : MediumTest
   * @tc.type      : Function
   * @tc.level     : Level 3
   */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_Crop_0100', 0, (done: Function) => {
      let resultPixelmap: number = ndkTest.testCreatePixelmap(6, 4, 3, 1)
      expect(resultPixelmap).assertEqual(0)
      let result: number = ndkTest.testCrop(100, 100, 100, 100)
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0100
     * @tc.name      : createImageSourceFromUri
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0100", 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0100"
      try {
        await NDK_CreateFromUri(testTag, "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0200
     * @tc.name      : createImageSourceFromUri
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0200", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0200'
      try {
        await NDK_CreateFromUri(testTag, "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0300
     * @tc.name      : createImageSourceFromUri
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0300", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0300'
      try {
        await NDK_CreateFromUri(testTag, "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0400
     * @tc.name      : createImageSourceFromUri
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0400", 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0400"
      try {
        await NDK_CreateFromUri(testTag, "test8.bmp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0500
     * @tc.name      : createImageSourceFromUri
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0500", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0500'
      try {
        await NDK_CreateFromUri(testTag, "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0600
     * @tc.name      : createImageSourceFromUri
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0600", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0600'
      try {
        await NDK_CreateFromUri(testTag, "test.arw", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0700
     * @tc.name      : createImageSourceFromUri
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0700", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0700'
      try {
        await NDK_CreateFromUri(testTag, "docx.ico", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0800
     * @tc.name      : createImageSourceFromUri
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0800", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0800'
      try {
        await NDK_CreateFromUri(testTag, "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0100
     * @tc.name      : createImageSourceFromFd
     * @tc.desc      : 1.get image fileFd
     *                 2.createImageSourceFromFd
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0100", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0100'
      try {
        await NDK_CreateFromFd(testTag, "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0200
     * @tc.name      : createImageSourceFromFd
     * @tc.desc      : 1.get image fileFd
     *                 2.createImageSourceFromFd
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0200", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0200'
      try {
        await NDK_CreateFromFd(testTag, "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0300
     * @tc.name      : createImageSourceFromFd
     * @tc.desc      : 1.get image fileFd
     *                 2.createImageSourceFromFd
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0300", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0300'
      try {
        await NDK_CreateFromFd(testTag, "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0400
     * @tc.name      : createImageSourceFromFd
     * @tc.desc      : 1.get image fileFd
     *                 2.createImageSourceFromFd
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0400", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0400'
      try {
        await NDK_CreateFromFd(testTag, "test8.bmp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0500
     * @tc.name      : createImageSourceFromFd
     * @tc.desc      : 1.get image fileFd
     *                 2.createImageSourceFromFd
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0500", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0500'
      try {
        await NDK_CreateFromFd(testTag, "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0600
     * @tc.name      : createImageSourceFromFd
     * @tc.desc      : 1.get image fileFd
     *                 2.createImageSourceFromFd
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0600", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0600'
      try {
        await NDK_CreateFromFd(testTag, "test.arw", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0700
     * @tc.name      : createImageSourceFromFd
     * @tc.desc      : 1.get image fileFd
     *                 2.createImageSourceFromFd
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0700", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0700'
      try {
        await NDK_CreateFromFd(testTag, "docx.ico", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }

    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0800
     * @tc.name      : createImageSourceFromFd
     * @tc.desc      : 1.get image fileFd
     *                 2.createImageSourceFromFd
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0800", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0800'
      try {
        await NDK_CreateFromFd(testTag, "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0100
     * @tc.name      : createImageSourceFromBuffer
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromBuffer
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0100", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0100'
      try {
        await NDK_CreateFromData(testTag, "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0200
     * @tc.name      : createImageSourceFromBuffer
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromBuffer
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0200", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0200'
      try {
        await NDK_CreateFromData(testTag, "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0300
     * @tc.name      : createImageSourceFromBuffer
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromBuffer
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0300", 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0300"
      try {
        await NDK_CreateFromData(testTag, "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0400
     * @tc.name      : createImageSourceFromBuffer
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromBuffer
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0400", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0400'
      try {
        await NDK_CreateFromData(testTag, "test8.bmp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0500
     * @tc.name      : createImageSourceFromBuffer
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromBuffer
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0500", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0500'
      try {
        await NDK_CreateFromData(testTag, "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0600
     * @tc.name      : createImageSourceFromBuffer
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromBuffer
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0600", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0600'
      try {
        await NDK_CreateFromData(testTag, "test.arw", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0700
     * @tc.name      : createImageSourceFromBuffer
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromBuffer
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0700", 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0700"
      try {
        await NDK_CreateFromData(testTag, "docx.ico", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0800
     * @tc.name      : createImageSourceFromBuffer
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromBuffer
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0800", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0800'
      try {
        await NDK_CreateFromData(testTag, "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0100
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0100", 0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYURI_0100'
      try {
        await NDK_CreatePixelMapByUri(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0200
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0200", 0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYURI_0200'
      try {
        await NDK_CreatePixelMapByUri(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0300
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0300", 0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYURI_0300'
      try {
        await NDK_CreatePixelMapByUri(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0400
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0400", 0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYURI_0400'
      try {
        await NDK_CreatePixelMapByUri(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test8.bmp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0500
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0500", 0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYURI_0500'
      try {
        await NDK_CreatePixelMapByUri(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0600
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0600", 0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYURI_0600'
      try {
        await NDK_CreatePixelMapByUri(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test.arw", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0700
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0700", 0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYURI_0700'
      try {
        await NDK_CreatePixelMapByUri(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "docx.ico", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0800
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0800", 0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYURI_0800'
      try {
        await NDK_CreatePixelMapByUri(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0900
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreatePixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0900", 0, async (done: Function) => {
      await NDK_CreatePixelMap('SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0900', "uri", "test5.jpg", 480, 360, done);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_1000
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreatePixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_1000", 0, async (done: Function) => {
      await NDK_CreatePixelMap('SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_1000', "uri", "test7.png", 550, 550, done);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0100
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0100", 0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYFD_0100'
      try {
        await NDK_CreatePixelMapByFd(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0200
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0200", 0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYFD_0200'
      try {
        await NDK_CreatePixelMapByFd(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0300
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0300", 0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYFD_0300'
      try {
        await NDK_CreatePixelMapByFd(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0400
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0400", 0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYFD_0400'
      try {
        await NDK_CreatePixelMapByFd(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test8.bmp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0500
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0500", 0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYFD_0500'
      try {
        await NDK_CreatePixelMapByFd(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0600
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0600", 0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYFD_0600'
      try {
        await NDK_CreatePixelMapByFd(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test.arw", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0700
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0700", 0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYFD_0700'
      try {
        await NDK_CreatePixelMapByFd(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "docx.ico", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0800
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0800", 0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYFD_0800'
      try {
        await NDK_CreatePixelMapByFd(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0900
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreatePixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0900", 0, async (done: Function) => {
      await NDK_CreatePixelMap('SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0900', "Fd", "test6.gif", 480, 270, done);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_1000
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreatePixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_1000", 0, async (done: Function) => {
      await NDK_CreatePixelMap('SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_1000', "Fd", "test8.bmp", 959, 959, done);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0100
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0100", 0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYDATA_0100'
      try {
        await NDK_CreatePixelMapByData(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0200
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0200", 0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYDATA_0200'
      try {
        await NDK_CreatePixelMapByData(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0300
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0300", 0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYDATA_0300'
      try {
        await NDK_CreatePixelMapByData(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0400
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0400", 0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYDATA_0400'
      try {
        await NDK_CreatePixelMapByData(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test8.bmp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0500
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0500", 0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYDATA_0500'
      try {
        await NDK_CreatePixelMapByData(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0600
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0600", 0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYDATA_0600'
      try {
        await NDK_CreatePixelMapByData(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test.arw", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0700
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0700", 0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYDATA_0700'
      try {
        await NDK_CreatePixelMapByData(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "docx.ico", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0800
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0800", 0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYDATA_0800'
      try {
        await NDK_CreatePixelMapByData(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0900
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreatePixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0900", 0, async (done: Function) => {
      await NDK_CreatePixelMap('SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0900', "Buffer", "test.webp", 1212, 681, done);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_1000
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreatePixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_1000", 0, async (done: Function) => {
      await NDK_CreatePixelMap('SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_1000', "Buffer", "test.arw", 3074, 2728, done);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_GIF_CREATE_RGBA8888LIST_BYURI_0100
     * @tc.name      : CreatePixelMapList
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMapList
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_GIF_CREATE_RGBA8888LIST_BYURI_0100", 0, async (done: Function) => {
      const testTag = 'GIF_CREATE_RGBA8888LIST_BYURI_0100'
      try {
        await NDK_CreatePixelMapListByUri(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_WEBP_CREATE_RGBA8888LIST_BYURI_0100
     * @tc.name      : CreatePixelMapList
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMapList
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_WEBP_CREATE_RGBA8888LIST_BYURI_0100", 0, async (done: Function) => {
      const testTag = 'WEBP_CREATE_RGBA8888LIST_BYURI_0100'
      try {
        await NDK_CreatePixelMapListByUri(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_GIF_CREATE_RGBA8888LIST_BYFD_0100
     * @tc.name      : CreatePixelMapList
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMapList
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_GIF_CREATE_RGBA8888LIST_BYFD_0100", 0, async (done: Function) => {
      const testTag = 'GIF_CREATE_RGBA8888LIST_BYFD_0100'
      try {
        await NDK_CreatePixelMapListByFd(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_WEBP_CREATE_RGBA8888LIST_BYFD_0100
     * @tc.name      : CreatePixelMapList
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMapList
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_WEBP_CREATE_RGBA8888LIST_BYFD_0100", 0, async (done: Function) => {
      const testTag = 'WEBP_CREATE_RGBA8888LIST_BYFD_0100'
      try {
        await NDK_CreatePixelMapListByFd(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_GIF_CREATE_RGBA8888LIST_BYDATA_0100
     * @tc.name      : CreatePixelMapList
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMapList
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_GIF_CREATE_RGBA8888LIST_BYDATA_0100", 0, async (done: Function) => {
      const testTag = 'GIF_CREATE_RGBA8888LIST_BYDATA_0100'
      try {
        await NDK_CreatePixelMapListByData(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_WEBP_CREATE_RGBA8888LIST_BYDATA_0100
     * @tc.name      : CreatePixelMapList
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMapList
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_WEBP_CREATE_RGBA8888LIST_BYDATA_0100", 0, async (done: Function) => {
      const testTag = 'WEBP_CREATE_RGBA8888LIST_BYDATA_0100'
      try {
        await NDK_CreatePixelMapListByData(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_DELAY_TIME_0100
     * @tc.name      : GetDelayTime
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetDelayTime
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_DELAY_TIME_0100", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_DELAY_TIME_0100'
      try {
        await NDK_GetDelayTime(testTag, "test6.gif", "Uri", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_DELAY_TIME_0200
     * @tc.name      : GetDelayTime
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetDelayTime
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_DELAY_TIME_0200", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_DELAY_TIME_0200'
      try {
        await NDK_GetDelayTime(testTag, "test6.gif", "Fd", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_DELAY_TIME_0300
     * @tc.name      : GetDelayTime
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromData
     *                 3.GetDelayTime
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_DELAY_TIME_0300", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_DELAY_TIME_0300'
      try {
        await NDK_GetDelayTime(testTag, "test6.gif", "Buffer", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0100
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0100", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0100'
      try {
        await NDK_GetImageInfoByUri(testTag, 0, "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0200
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0200", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0200'
      try {
        await NDK_GetImageInfoByUri(testTag, 0, "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0300
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0300", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0300'
      try {
        await NDK_GetImageInfoByUri(testTag, 0, "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0400
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0400", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0400'
      try {
        await NDK_GetImageInfoByUri(testTag, 0, "test8.bmp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0500
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0500", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0500'
      try {
        await NDK_GetImageInfoByUri(testTag, 0, "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0600
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0600", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0600'
      try {
        await NDK_GetImageInfoByUri(testTag, 0, "test.arw", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0700
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0700", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0700'
      try {
        await NDK_GetImageInfoByUri(testTag, 0, "docx.ico", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0800
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0800", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0800'
      try {
        await NDK_GetImageInfoByUri(testTag, 0, "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0100
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0100", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0100'
      try {
        await NDK_GetImageInfoByFd(testTag, 0, "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0200
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0200", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0200'
      try {
        await NDK_GetImageInfoByFd(testTag, 0, "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0300
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0300", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0300'
      try {
        await NDK_GetImageInfoByFd(testTag, 0, "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0400
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0400", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0400'
      try {
        await NDK_GetImageInfoByFd(testTag, 0, "test8.bmp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0500
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0500", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0500'
      try {
        await NDK_GetImageInfoByFd(testTag, 0, "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0600
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0600", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0600'
      try {
        await NDK_GetImageInfoByFd(testTag, 0, "test.arw", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0700
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0700", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0700'
      try {
        await NDK_GetImageInfoByFd(testTag, 0, "docx.ico", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0800
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0800", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0800'
      try {
        await NDK_GetImageInfoByFd(testTag, 0, "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0100
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromData
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0100", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0100'
      try {
        await NDK_GetImageInfoByData(testTag, 0, "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0200
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromData
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0200", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0200'
      try {
        await NDK_GetImageInfoByData(testTag, 0, "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0300
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromData
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0300", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0300'
      try {
        await NDK_GetImageInfoByData(testTag, 0, "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0400
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromData
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0400", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0400'
      try {
        await NDK_GetImageInfoByData(testTag, 0, "test8.bmp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0500
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromData
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0500", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0500'
      try {
        await NDK_GetImageInfoByData(testTag, 0, "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0600
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromData
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0600", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0600'
      try {
        await NDK_GetImageInfoByData(testTag, 0, "test.arw", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0700
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromData
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0700", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0700'
      try {
        await NDK_GetImageInfoByData(testTag, 0, "docx.ico", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0800
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromData
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0800", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0800'
      try {
        await NDK_GetImageInfoByData(testTag, 0, "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0100
     * @tc.name      : GetImageProperty
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0100", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0100'
      try {
        await NDK_GetImageProperty(testTag, "test_exif_v2.jpg", "Uri", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0200
     * @tc.name      : GetImageProperty
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0200", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0200'
      try {
        await NDK_GetImageProperty(testTag, "test_exif_v2.jpg", "Fd", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_URI_0100
     * @tc.name      : GetImageProperty
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.ModifyImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_URI_0100", 0, async (done: Function) => {
      const testTag = 'MODIFY_IMAGE_PROPERTY_URI_0100'
      try {
        await NDK_ModifyImagePropertyByUri(testTag, "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_FD_0100
     * @tc.name      : GetImageProperty
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.ModifyImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_FD_0100", 0, async (done: Function) => {
      const testTag = 'MODIFY_IMAGE_PROPERTY_FD_0100'
      try {
        await NDK_ModifyImagePropertyByFd(testTag, "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_FRAME_COUNT_0100
     * @tc.name      : GetFrameCount
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetFrameCount
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_FRAME_COUNT_0100", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_FRAME_COUNT_0100'
      try {
        await NDK_GetFrameCount(testTag, "test6.gif", "Uri", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_FRAME_COUNT_0200
     * @tc.name      : GetFrameCount
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetFrameCount
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_FRAME_COUNT_0200", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_FRAME_COUNT_0200'
      try {
        await NDK_GetFrameCount(testTag, "test6.gif", "Fd", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCERELEASE_0100
     * @tc.name      : SourceRelease
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromuri
     *                 3.SourceRelease
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCERELEASE_0100", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCERELEASE_0100'
      try {
        await NDK_SourceRelease(testTag, "test5.jpg", "Uri", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCERELEASE_0200
     * @tc.name      : SourceRelease
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.SourceRelease
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCERELEASE_0200", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCERELEASE_0200'
      try {
        await NDK_SourceRelease(testTag, "test5.jpg", "Fd", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCERELEASE_0300
     * @tc.name      : SourceRelease
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromData
     *                 3.SourceRelease
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCERELEASE_0300", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCERELEASE_0300'
      try {
        await NDK_SourceRelease(testTag, "test5.jpg", "Buffer", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GETIMAGEINFOBYOPTION_TO_RGBA8888_0100
     * @tc.name      : NDK_GetImageInfoByOption
     * @tc.desc      : 1.CreateDecodingOptions,2.DecodingOptionsSetPixelFormat,3.DecodingOptionsSetIndex,
     *                 4.DecodingOptionsSetRotate,5.DecodingOptionsSetDesiredSize,6.DecodingOptionsSetDesiredRegion,
     *                 7.DecodingOptionsGetPixelFormat,8.DecodingOptionsGetIndex9.DecodingOptionsGetRotate,
     *                 10.DecodingOptionsGetDesiredSize,11.DecodingOptionsGetDesiredRegion
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GETIMAGEINFOBYOPTION_TO_RGBA8888_0100", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GETIMAGEINFOBYOPTION_TO_RGBA8888_0100'
      try {
        await NDK_GetImageInfoByOption('SUB_MULTIMEDIA_IMAGE_NDK_GETIMAGEINFOBYOPTION_TO_RGBA8888_0100', 0, 90, 0, 0, 100,
          200, 400, 600, 3, done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_CREATE_0100
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.ndkTest.Create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_CREATE_0100', 0, async (done: Function) => {
      try {
        const parker: image.ImagePacker = ndkTest.PackerCreate()
        if (parker) {
          expect(true).assertTrue();
          done()
        } else {
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', `SUB_MULTIMEDIA_IMAGE_NDK_PACKING_CREATE_0100:${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_RELEASE_0100
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.ndkTest.Create
     2.ndkTest.Release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_RELEASE_0100', 0, async (done: Function) => {
      try {
        const parker: image.ImagePacker = ndkTest.PackerCreate()
        if (parker) {
          const release: number = ndkTest.PackerRelease(parker)
          if (release != undefined) {
            hilog.info(0x0000, 'scaleTest', '%{public}s', `SUB_MULTIMEDIA_IMAGE_NDK_PACKING_RELEASE_0100 success`)
            expect(true).assertTrue();
            done()
          } else {
            hilog.info(0x0000, 'scaleTest', '%{public}s', `SUB_MULTIMEDIA_IMAGE_NDK_PACKING_RELEASE_0100 failed: `)
            expect(false).assertTrue();
            done()
          }
        } else {
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', `SUB_MULTIMEDIA_IMAGE_NDK_PACKING_RELEASE_0100:${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0100
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndke
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0100', 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0100"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packing", "imageSource", 100,
          "image/jpeg", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0200
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0200', 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0200"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packing", "pixelMap", 100,
          "image/jpeg", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0300
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0300', 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0300"
      try {
        await NDK_Packer("SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0300", "test5.jpg", done, "packing", "imageSource", 10,
          "image/jpeg", true)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0400
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0400', 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0400"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packing", "pixelMap", 10, "image/jpeg", true)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0500
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0500', 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0500"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packing", "imageSource", 100, "image/webp", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0600
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0600', 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0600"
      try {
        await NDK_Packer("SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0600", "test5.jpg", done, "packing", "pixelMap", 100,
          "image/webp", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0700
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0700', 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0700"
      try {
        await NDK_Packer("SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0700", "test5.jpg", done, "packing", "imageSource", 10,
          "image/webp", true)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0800
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0800', 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0800"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packing", "pixelMap", 10,
          "image/webp", true)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0900
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0900', 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0900"
      try {
        await NDK_Packer("SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0900", "test5.jpg", done, "packing", "imageSource", 100,
          "image/png", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_01000
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_01000', 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_01000"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packing", "imageSource", 100,
          "image/png", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_01100
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_01100', 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_01100"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packing", "pixelMap", 10,
          "image/png", true)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_01200
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_01200', 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_01200"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packing", "imageSource", 10,
          "image/png", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0100
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0100', 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0100"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile", "imageSource",
          100, "image/jpeg", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0200
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0200', 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0200"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile", "pixelMap",
          100, "image/jpeg", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0300
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0300', 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0300"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile",
          "imageSource", 10, "image/jpeg", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0400
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0400', 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0400"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile", "pixelMap",
          10, "image/jpeg", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0500
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0500', 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0500"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile", "imageSource",
          100, "image/webp", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0600
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0600', 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0600"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile", "pixelMap",
          100, "image/webp", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0700
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0700', 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0700"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile", "imageSource",
          10, "image/webp", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0800
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0800', 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0800"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile", "pixelMap",
          10, "image/webp", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0900
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0900', 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0900"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile", "imageSource",
          100, "image/png", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_01000
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_01000', 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_01000"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile", "pixelMap",
          100, "image/png", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_01100
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_01100', 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_01100"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile",
          "imageSource", 10, "image/png", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_01200
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_01200', 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_01200"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile", "pixelMap",
          10, "image/png", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0100
     * @tc.name      : createImageSourceFromRawFile
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromRawFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0100", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0100'
      try {
        await NDK_CreateFromRawFile(testTag, "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0200
     * @tc.name      : createImageSourceFromRawFile
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromRawFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0200", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0200'
      try {
        await NDK_CreateFromRawFile(testTag, "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0300
     * @tc.name      : createImageSourceFromRawFile
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromRawFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0300", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0300'
      try {
        await NDK_CreateFromRawFile(testTag, "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0400
     * @tc.name      : createImageSourceFromRawFile
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromRawFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0400", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0400'
      try {
        await NDK_CreateFromRawFile(testTag, "test8.bmp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0500
     * @tc.name      : createImageSourceFromRawFile
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromRawFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0500", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0500'
      try {
        await NDK_CreateFromRawFile(testTag, "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0600
     * @tc.name      : createImageSourceFromRawFile
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromRawFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0600", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0600'
      try {
        await NDK_CreateFromRawFile(testTag, "test.arw", done);
      }catch(error){
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0700
     * @tc.name      : createImageSourceFromRawFile
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromRawFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0700", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0700'
      try {
        await NDK_CreateFromRawFile(testTag, "docx.ico", done);
      }catch(error){
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0800
     * @tc.name      : createImageSourceFromRawFile
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromRawFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0800", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0800'
      try {
        await NDK_CreateFromRawFile(testTag, "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0100
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreateDecodingOptions,4.DecodingOptionsSetPixelFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0100", 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0100"
      try {
        await NDK_CreatePixelMapByRawFile(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3, "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0200
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreateDecodingOptions,4.DecodingOptionsSetPixelFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0200", 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0200"
      try {
        await NDK_CreatePixelMapByRawFile(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3, "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0300
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreateDecodingOptions,4.DecodingOptionsSetPixelFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0300", 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0300"
      try {
        await NDK_CreatePixelMapByRawFile(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3, "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0400
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreateDecodingOptions,4.DecodingOptionsSetPixelFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0400", 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0400"
      try {
        await NDK_CreatePixelMapByRawFile(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3, "test8.bmp", done);
      }catch (error){
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0500
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreateDecodingOptions,4.DecodingOptionsSetPixelFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0500", 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0500"
      try {
        await NDK_CreatePixelMapByRawFile(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3, "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0600
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreateDecodingOptions,4.DecodingOptionsSetPixelFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0600", 0, async (done: Function) => {
      const testTag ="SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0600"
      try {
        await NDK_CreatePixelMapByRawFile(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3, "test.arw", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0700
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreateDecodingOptions,4.DecodingOptionsSetPixelFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0700", 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0700"
      try {
        await NDK_CreatePixelMapByRawFile(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3, "docx.ico", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0800
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreateDecodingOptions,4.DecodingOptionsSetPixelFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0800", 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0800"
      try {
        await NDK_CreatePixelMapByRawFile(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3, "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0900
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreatePixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0900", 0, async (done: Function) => {
      await NDK_CreatePixelMap('SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0900', "RawFile", "docx.ico", 512, 512, done);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_1000
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreatePixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_1000", 0, async (done: Function) => {
      await NDK_CreatePixelMap('SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_1000', "RawFile", "SVG.svg", 1593, 1594, done);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_GIF_CREATE_RGBA8888LIST_BYRAWFILE_0100
     * @tc.name      : CreatePixelMapList
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreateDecodingOptions,4.DecodingOptionsSetPixelFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMapList
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_GIF_CREATE_RGBA8888LIST_BYRAWFILE_0100", 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_GIF_CREATE_RGBA8888LIST_BYRAWFILE_0100"
      try {
        await NDK_CreatePixelMapListByRawFile(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3, "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_WEBP_CREATE_RGBA8888LIST_BYRAWFILE_0100
     * @tc.name      : CreatePixelMapList
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreateDecodingOptions,4.DecodingOptionsSetPixelFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMapList
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_WEBP_CREATE_RGBA8888LIST_BYRAWFILE_0100", 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_WEBP_CREATE_RGBA8888LIST_BYRAWFILE_0100"
      try {
        await NDK_CreatePixelMapListByRawFile(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3, "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_HDR_0100
     * @tc.name      : sub_multimedia_image_create_hdr
     * @tc.desc      : 1.hdr pixelMap create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_HDR_0100', 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_CREATE_HDR_0100"
      try {
        await CreatePixelMapByHdr(testTag, done)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAP_TOSDR_0100
     * @tc.name      : sub_multimedia_pixelmap_tosdr
     * @tc.desc      : 1.hdr pixelMap create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PIXELMAP_TOSDR_0100', 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_PIXELMAP_TOSDR_0100"
      try {
        await PixelMapToSdr(testTag, done)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_DECODINGOPTIONS_DYNAMICRANGE_0100
     * @tc.name      : sub_multimedia_image_get_decoding_dynamicrange_options
     * @tc.desc      : 1.decodingOptions dynamicrange
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_DECODINGOPTIONS_DYNAMICRANGE_0100', 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_GET_DECODINGOPTIONS_DYNAMICRANGE_0100"
      try {
        await DecodingOptionsDesiredDynamic(testTag, 1, done)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_PACKINGOPTIONS_DYNAMICRANGE_0100
     * @tc.name      : sub_multimedia_image_get_packing_dynamicrange_options
     * @tc.desc      : 1.packingOptions dynamicrange
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_PACKINGOPTIONS_DYNAMICRANGE_0100', 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_GET_PACKINGOPTIONS_DYNAMICRANGE_0100"
      try {
        await PackingOptionsDesiredDynamic(testTag, 1, done)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_IMAGESOURCE_DYNAMICRANGE_0100
     * @tc.name      : sub_multimedia_image_check_imagesource_dynamicrange
     * @tc.desc      : 1.imagesource_dynamicrange
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CHECK_IMAGESOURCE_DYNAMICRANGE_0100', 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_CHECK_IMAGESOURCE_DYNAMICRANGE_0100"
      try {
        await CheckImageSourceDynamicRange(testTag, done)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_PACKINGOPTIONS_NEEDSPACKPROPERTIES_0100
     * @tc.name      : sub_multimedia_image_get_packing_needs_pack_properties_options
     * @tc.desc      : 1.packingOptions needsPackProperties
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_PACKINGOPTIONS_NEEDSPACKPROPERTIES_0100', 0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_GET_PACKINGOPTIONS_NEEDSPACKPROPERTIES_0100"
      try {
        await PackingOptionsNeedsPackProperties(testTag, 1, done)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

     /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NATIVE_REGIONDECODE_0100
     * @tc.name     : CreatePixelMap
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize,
                      5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NATIVE_REGIONDECODE_0100", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NATIVE_REGIONDECODE_0100'
      try {
        let desiredSize: image.Size = { width: 960, height: 1440 };
        let desiredRegionSize: image.Size = { width: 800, height: 800 };
        let desiredRegion: image.Region = { size: desiredRegionSize, x: 0, y: 0 };
        await NATIVE_RegionDecode(testTag, desiredRegion.x, desiredRegion.y, desiredRegionSize.width, desiredRegionSize.height,
        desiredSize.width, desiredSize.height, "jpeg_test_1440x1920.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NATIVE_REGIONDECODE_0200
     * @tc.name     : CreatePixelMap
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize,
                      5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NATIVE_REGIONDECODE_0200", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NATIVE_REGIONDECODE_0200'
      try {
        let desiredSize: image.Size = { width: 960, height: 1440 };
        let desiredRegionSize: image.Size = { width: 800, height: 800 };
        let desiredRegion: image.Region = { size: desiredRegionSize, x: 0, y: 0 };
        await NATIVE_RegionDecode(testTag, desiredRegion.x, desiredRegion.y, desiredRegionSize.width, desiredRegionSize.height,
        desiredSize.width, desiredSize.height, "jpeg_test_1440x1920.jpg", done, image.CropAndScaleStrategy.SCALE_FIRST);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NATIVE_REGIONDECODE_0300
     * @tc.name     : CreatePixelMap
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize,
                      5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NATIVE_REGIONDECODE_0300", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NATIVE_REGIONDECODE_0300'
      try {
        let desiredSize: image.Size = { width: 960, height: 1440 };
        let desiredRegionSize: image.Size = { width: 800, height: 800 };
        let desiredRegion: image.Region = { size: desiredRegionSize, x: 0, y: 0 };
        await NATIVE_RegionDecode(testTag, desiredRegion.x, desiredRegion.y, desiredRegionSize.width, desiredRegionSize.height,
        desiredSize.width, desiredSize.height, "jpeg_test_1440x1920.jpg", done, image.CropAndScaleStrategy.CROP_FIRST);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });
  })
}
