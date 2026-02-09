/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import fs from '@ohos.file.fs';
import image from '@ohos.multimedia.image';
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import resourceManager from '@ohos.resourceManager';
import common from '@ohos.app.ability.common';
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';
import { initialize } from './AbilityContextHelper.test';

let testContext: common.UIAbilityContext | undefined;
let filesDir: string | undefined | null;

let g_callbackResult = false;

let sleep = async (count:int) : Promise<int> => {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, count)
  });
};

let waitCallback = () => {
  const date = Date.now();
  while ((Date.now() - date) < 1000) {
    if (g_callbackResult) {
      waitForCompletion(async () => {await sleep(50);})
      return;
    } else {
      waitForCompletion(async () => {await sleep(50);})
    }
  }
  expect().assertFail();
}

export default function imageDecodeOptionsYuvTest() {
  describe('ImageDecodeOptionsYuv', () => {
    let filePath: string;
    let globalPixelMap: image.PixelMap | undefined = undefined;
    let result: boolean = false;

    const getBuffer = (fileName: string) => {
      filePath = filesDir + '/' + fileName;
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize);
      fs.readSync(file.fd, bufferRead);
      return bufferRead
    }

    const getImageSource = (fileName: string, type?: string) => {
      let imageSourceApi: image.ImageSource | undefined;
      if (type === "buffer") {
        const buffer = getBuffer(fileName)
        imageSourceApi = image.createImageSource(buffer)
      } else if (type === "uri") {
        const filePath = filesDir + '/' + fileName
        imageSourceApi = image.createImageSource(filePath)
      } else if (type === "rawfile") {
        const resourceMgr: resourceManager.ResourceManager = testContext!.resourceManager;
        let rawFileDescriptor: resourceManager.RawFileDescriptor | undefined;
        waitForCompletion(async () => {rawFileDescriptor = await resourceMgr.getRawFd(fileName);})
        imageSourceApi = image.createImageSource(rawFileDescriptor as resourceManager.RawFileDescriptor)
      } else if (type === "incremental") {
        const picBuffer = getBuffer(fileName)
        imageSourceApi = image.createIncrementalSource(picBuffer)
      } else {
        const filePath = filesDir + "/" + fileName;
        const file = fs.openSync(filePath)
        imageSourceApi = image.createImageSource(file.fd as int);
      }
      waitForCompletion(async () => {await sleep(100);})
      if (imageSourceApi == undefined) {
        expect().assertFail();
      }
      let result: image.ImageSource = imageSourceApi as image.ImageSource;
      return result;
    }

    const promiseCreate = async (
      TAG: string, imageSourceApi: image.ImageSource,
      decodingOptions: image.DecodingOptions
    ) => {
      try{
        let pixelMap = await imageSourceApi.createPixelMap(decodingOptions);
        globalPixelMap = pixelMap;
        await imageSourceApi.release();
        if (pixelMap == undefined) {
          return undefined;
        }
        let imageInfo = await pixelMap.getImageInfo();
        if (imageInfo == undefined) {
          return undefined;
        }
        g_callbackResult = true;
        hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' imageInfo:' + JSON.stringify(imageInfo));
        hilog.info(0x0000, 'testTag', '%{public}s', TAG + ` decodingOptions:${JSON.stringify(decodingOptions)};`);
        let colorSpaceManager = decodingOptions.desiredColorSpace as colorSpaceManager.ColorSpaceManager
        let desiredPixelFormat = decodingOptions.desiredPixelFormat
        let desiredSize = decodingOptions.desiredSize as image.Size
        let fitDensity = decodingOptions.fitDensity
        if (imageInfo.pixelFormat === desiredPixelFormat &&
          imageInfo.size.width === desiredSize.width &&
          imageInfo.size.height === desiredSize.height &&
          imageInfo.density === fitDensity &&
          pixelMap.getColorSpace().getColorSpaceName() === colorSpaceManager.getColorSpaceName()) {
          result = true
        }
      } catch(err) {
        hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' getImageInfo err ' + JSON.stringify(err));
      }
    }

    const callBackCreate = async (
      TAG: string, imageSourceApi: image.ImageSource,
      decodingOptions: image.DecodingOptions
    ) => {
      imageSourceApi.createPixelMap(decodingOptions, (err : BusinessError|null, pixelMap : image.PixelMap|undefined) => {
        if (err && err.code) {
          hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' getImageInfo err ' + JSON.stringify(err));
          await imageSourceApi.release();
        } else {
          globalPixelMap = pixelMap!;
          await imageSourceApi.release();
          let imageInfo = await pixelMap!.getImageInfo();
          if (imageInfo != undefined) {
            g_callbackResult = true;
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' imageInfo:' + JSON.stringify(imageInfo));
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ` decodingOptions:${JSON.stringify(decodingOptions)};`);
            let colorSpaceManager = decodingOptions.desiredColorSpace as colorSpaceManager.ColorSpaceManager
            let desiredPixelFormat = decodingOptions.desiredPixelFormat
            let desiredSize = decodingOptions.desiredSize as image.Size
            let fitDensity = decodingOptions.fitDensity
            if (imageInfo.pixelFormat === desiredPixelFormat &&
              imageInfo.size.width === desiredSize.width &&
              imageInfo.size.height === desiredSize.height &&
              imageInfo.density === fitDensity &&
              pixelMap!.getColorSpace().getColorSpaceName() === colorSpaceManager.getColorSpaceName()) {
              result = true
            }
          }
        }
      })
    }

    const syncCreate = async (
      TAG: string, imageSourceApi: image.ImageSource,
      decodingOptions: image.DecodingOptions
    ) => {
      globalPixelMap = imageSourceApi.createPixelMapSync(decodingOptions);
      await imageSourceApi.release();
      if (globalPixelMap == undefined) {
        return undefined;
      }
      let imageInfo = await globalPixelMap!.getImageInfo();
      if (imageInfo == undefined) {
        return undefined;
      }
      g_callbackResult = true;
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' imageInfo:' + JSON.stringify(imageInfo));
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + ` decodingOptions:${JSON.stringify(decodingOptions)};`);
      let colorSpaceManager = decodingOptions.desiredColorSpace as colorSpaceManager.ColorSpaceManager
      let desiredPixelFormat = decodingOptions.desiredPixelFormat
      let desiredSize = decodingOptions.desiredSize as image.Size
      let fitDensity = decodingOptions.fitDensity
      if (imageInfo.pixelFormat === desiredPixelFormat &&
        imageInfo.size.width === desiredSize.width &&
        imageInfo.size.height === desiredSize.height &&
        imageInfo.density === fitDensity &&
        globalPixelMap!.getColorSpace().getColorSpaceName() === colorSpaceManager.getColorSpaceName()) {
        result = true
      }
    }

    const getResult = async (
      TAG: string, width: int, height: int,
      desiredPixelFormat: image.PixelMapFormat, serviceName: string, fileName: string,
      type: string, desiredColorSpace: colorSpaceManager.ColorSpaceManager
    ) => {
      result = false;
      const imageSourceApi = getImageSource(fileName, type);
      if (imageSourceApi == undefined) {
        console.info(TAG + " create image source failed");
      } else {
        let decodingOptions: image.DecodingOptions = {
          sampleSize: 1,
          editable: true,
          desiredSize: {
            width: width, height: height
          },
          rotate: 10,
          desiredPixelFormat: desiredPixelFormat,
          desiredRegion: { size: { height: 80, width: 120 }, x: 0, y: 0 },
          index: 0,
          fitDensity: 240,
          desiredColorSpace: desiredColorSpace,
          desiredDynamicRange: 0 as image.DecodingDynamicRange
        };
        switch (serviceName){
          case 'promiseCreate':
            await promiseCreate(TAG, imageSourceApi, decodingOptions);
            break
          case 'callBackCreate':
            await callBackCreate(TAG, imageSourceApi, decodingOptions);
            break
          case 'syncCreate':
            await syncCreate(TAG, imageSourceApi, decodingOptions);
            break
        }
        await sleep(100);
      }
    }

    const getResultYuv311 = async (
        TAG: string, width: int, height: int,
        desiredPixelFormat: image.PixelMapFormat, serviceName: string,
        fileName: string, type: string, desiredColorSpace: colorSpaceManager.ColorSpaceManager
    ) => {
      result = false;
      const imageSourceApi = getImageSource(fileName, type);
      if (imageSourceApi == undefined) {
        console.info(TAG + " create image source failed");
      } else {
        let decodingOptions: image.DecodingOptions = {
          sampleSize: 1,
          editable: true,
          desiredSize: {
            width: width, height: height
          },
          rotate: 90,
          desiredPixelFormat: desiredPixelFormat,
          desiredRegion: {
            size: {
              height: 300, width: 450
            }, x: 0, y: 0
          },
          index: 0,
          fitDensity: 240,
          desiredColorSpace: desiredColorSpace,
          desiredDynamicRange: 0 as image.DecodingDynamicRange
        };
        switch (serviceName) {
          case 'promiseCreate':
            await promiseCreate(TAG, imageSourceApi, decodingOptions);
            break
          case 'callBackCreate':
            await callBackCreate(TAG, imageSourceApi, decodingOptions);
            break
          case 'syncCreate':
            await syncCreate(TAG, imageSourceApi, decodingOptions);
            break
        }
        await sleep(100);
      }
    }

    const VerifyPixelMap = async (
        TAG: string, imageSourceApi: image.ImageSource, width: int, height: int,
        decodingOptions: image.DecodingOptions
    ) => {
      globalPixelMap = imageSourceApi.createPixelMapSync(decodingOptions)
      await imageSourceApi.release();
      if (globalPixelMap == undefined) {
        return undefined;
      }
      let imageInfo = await globalPixelMap!.getImageInfo()
      g_callbackResult = true;
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' imageInfo:' + JSON.stringify(imageInfo));
      let desiredPixelFormat = image.PixelMapFormat.RGBA_8888;
      let fitDensity = 0;
      let alphaType = image.AlphaType.PREMUL;
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + ` expectation desiredPixelFormat:${desiredPixelFormat},
      fitDensity:${fitDensity}, alphaType:${alphaType}, width:${width}, height:${height}`);
      if (imageInfo.pixelFormat === desiredPixelFormat &&
          imageInfo.size.width === width &&
          imageInfo.size.height === height &&
          imageInfo.density === fitDensity &&
          imageInfo.alphaType === alphaType) {
          result = true
      }
    }

    const getResultYuv311Null = async (
        TAG: string, serviceName: string, width: int, height: int,
        fileName: string, type: string
    ) => {
      result = false;
      const imageSourceApi = getImageSource(fileName, type);
      if (imageSourceApi == undefined) {
        console.info(TAG + " create image source failed");
      } else {
        let decodingOptions: image.DecodingOptions = {};
        switch (serviceName) {
          case 'VerifyPixelMap':
            await VerifyPixelMap(TAG, imageSourceApi, width, height, decodingOptions);
            break
        }
        await sleep(100);
      }
    }

    beforeAll(async () => {
      await initialize();
      filesDir = Hypium.get('filesDir') as string | undefined | null;
      testContext = Hypium.get('context') as common.UIAbilityContext;
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeAll case');
    })

    beforeEach(() => {
      g_callbackResult = false;
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeEach case');
    })

    afterEach(async () => {
      if (globalPixelMap != undefined) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'globalPixelMap release start');
        try {
          await globalPixelMap!.release();
        } catch (error) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'globalPixelMap release fail');
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s', 'afterEach case');
    })

    afterAll(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'afterAll case');
    })
    
    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0100
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0100
     * @tc.desc   Test_createPixelMap_decodingOptions_pixelFormat_8_JPEG_444
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        await getResult('SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0100',
          240, 180, image.PixelMapFormat.NV21, 'promiseCreate', "test_tree_444.jpg", "buffer",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB));
        waitCallback()
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0200
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0200
     * @tc.desc   Test_createPixelMap_decodingOptions_pixelFormat_8_NV21_JPEG_ODD_440
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0200",
          241, 181, image.PixelMapFormat.NV21, 'promiseCreate', "test_treeodd_440.jpg", "uri",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3));
        waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0200 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0300
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0300
     * @tc.desc   Test_createPixelMap_decodingOptions_pixelFormat_8_NV21_JPEG_422
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0300",
          240, 150, image.PixelMapFormat.NV21, 'syncCreate', "test_tree_422.jpg", "rawfile",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3));
        waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0300 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0400
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0400
     * @tc.desc   Test_createPixelMap_decodingOptions_asyncCallback_pixelFormat_8_NV21_JPEG_ODD_420
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0400",
          241, 151, image.PixelMapFormat.NV21, 'callBackCreate', "test_treeodd_420.jpg", "buffer",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998));
        waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0400 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0500
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0500
     * @tc.desc   Test_createPixelMap_decodingOptions_asyncCallback_pixelFormat_8_NV21_JPEG_411
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0500",
          241, 181, image.PixelMapFormat.NV21, 'callBackCreate', "test_tree_411.jpg", "fd",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB));
        waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0500 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0600
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0600
     * @tc.desc   Test_createPixelMap_decodingOptions_asyncCallback_pixelFormat_8_NV21_JPEG_ODD_400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0600", Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0600",
          240, 180, image.PixelMapFormat.NV21, 'syncCreate', "test_treeodd_400.jpg", "buffer",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3));
        waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0600 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0700
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0700
     * @tc.desc   Test_createPixelMap_decodingOptions_pixelFormat_9_NV12_JPEG_444
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0700", Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0700",
          481, 181, image.PixelMapFormat.NV12, 'syncCreate', "test_tree_444.jpg", "buffer",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3));
        waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0700 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0800
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0800
     * @tc.desc   Test_createPixelMap_decodingOptions_pixelFormat_9_NV12_JPEG_ODD_440
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0800", Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0800",
          480, 180, image.PixelMapFormat.NV12, 'promiseCreate', "test_treeodd_440.jpg", "uri",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998));
        waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0800 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0900
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0900
     * @tc.desc   Test_createPixelMap_decodingOptions_pixelFormat_9_NV12_JPEG_422
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0900", Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0900",
          480, 150, image.PixelMapFormat.NV12, 'promiseCreate', "test_tree_422.jpg", "rawfile",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB));
        waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_0900 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_1000
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_1000
     * @tc.desc   Test_createPixelMap_decodingOptions_asyncCallback_pixelFormat_9_NV12_JPEG_ODD_420
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_1000", Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        //TODO incremental创建ImageSource目前功能有问题用buffer替代后续替换
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_1000",
          481, 151, image.PixelMapFormat.NV12, 'syncCreate', "test_treeodd_420.jpg", "buffer",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3));
        waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_1000 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_1100
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_1100
     * @tc.desc   Test_createPixelMap_decodingOptions_asyncCallback_pixelFormat_9_NV12_JPEG_411
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_1100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_1100",
          480, 180, image.PixelMapFormat.NV12, 'callBackCreate', "test_tree_411.jpg", "fd",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3));
        waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_1100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_1200
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_1200
     * @tc.desc   Test_createPixelMap_decodingOptions_asyncCallback_pixelFormat_9_NV12_JPEG_ODD_400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_1200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_1200",
          480, 180, image.PixelMapFormat.NV12, 'callBackCreate', "test_treeodd_400.jpg", "buffer",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998));
        waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_STATIC_1200 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0100
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0100
     * @tc.desc   Test_createPixelMap_decodingOptions_pixelFormat_8_JPEG_I_I_311
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await getResultYuv311('SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0100',
          480, 360, image.PixelMapFormat.NV21, 'promiseCreate', "JPG-480360-YUV311.jpg", "buffer",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB));
        waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0200
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0200
     * @tc.desc   Test_createPixelMap_decodingOptions_pixelFormat_9_JPEG_I_I_311
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await getResultYuv311("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0200",
          480, 360, image.PixelMapFormat.NV12, 'callBackCreate', "JPG-480360-YUV311.jpg", "rawfile",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3));
        waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0200 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0300
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0300
     * @tc.desc   Test_createPixelMap_decodingOptions_pixelFormat_8_JPEG_I_odd_311
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await getResultYuv311('SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0300',
          480, 361, image.PixelMapFormat.NV21, 'syncCreate', "JPG-480361-YUV311.jpg", "buffer",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3));
        waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0300 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0400
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0400
     * @tc.desc   Test_createPixelMap_decodingOptions_pixelFormat_9_JPEG_I_odd_311
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await getResultYuv311("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0400",
          480, 361, image.PixelMapFormat.NV12, 'promiseCreate', "JPG-480361-YUV311.jpg", "fd",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998));
        waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0400 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0500
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0500
     * @tc.desc   Test_createPixelMap_decodingOptions_pixelFormat_8_JPEG_odd_I_311
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await getResultYuv311('SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0500',
          481, 360, image.PixelMapFormat.NV21, 'callBackCreate', "JPG-481360-YUV311.jpg", "buffer",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB));
        waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0500 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0600
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0600
     * @tc.desc   Test_createPixelMap_decodingOptions_pixelFormat_9_JPEG_odd_I_311
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0600", Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await getResultYuv311("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0600",
          481, 360, image.PixelMapFormat.NV12, 'syncCreate', "JPG-481360-YUV311.jpg", "uri",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3));
        waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0600 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0700
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0700
     * @tc.desc   Test_createPixelMap_decodingOptions_pixelFormat_8_JPEG_ODD_odd_odd_311
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0700", Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await getResultYuv311('SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0700',
          481, 361, image.PixelMapFormat.NV21, 'promiseCreate', "JPG-480360-YUV311.jpg", "rawfile",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3));
        waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0700 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0800
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0800
     * @tc.desc   Test_createPixelMap_decodingOptions_pixelFormat_9_JPEG_odd_odd_311
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0800", Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await getResultYuv311("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0800",
          481, 361, image.PixelMapFormat.NV12, 'callBackCreate', "JPG-480360-YUV311.jpg", "fd",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998));
        waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0800 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0900
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0900
     * @tc.desc   Test_createPixelMap_decodingOptions_MULL_pixelFormat_JPEG_I_I_311
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0900", Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await getResultYuv311Null("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0900",
          'VerifyPixelMap', 480, 360, "JPG-480360-YUV311.jpg", "buffer");
        waitCallback()
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_0900 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_1000
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_1000
     * @tc.desc   Test_createPixelMap_decodingOptions_MULL_pixelFormat_JPEG_I_odd_311
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_1000", Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await getResultYuv311Null("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_1000",
          'VerifyPixelMap', 480, 361, "JPG-480361-YUV311.jpg", "uri");
        waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_1000 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_1100
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_1100
     * @tc.desc   Test_createPixelMap_decodingOptions_MULL_pixelFormat_JPEG_odd_I_311
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_1100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await getResultYuv311Null("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_1100",
          'VerifyPixelMap', 481, 360, "JPG-481360-YUV311.jpg", "rawfile");
        waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_1100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_1200
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_1200
     * @tc.desc   Test_createPixelMap_decodingOptions_MULL_pixelFormat_JPEG_odd_odd_311
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_1200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await getResultYuv311Null("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_1200",
          'VerifyPixelMap', 481, 361, "JPG-481361-YUV311.jpg", "fd");
        waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_STATIC_1200 error:' + e);
        expect().assertFail();
        done();
      }
    });
  })
}


