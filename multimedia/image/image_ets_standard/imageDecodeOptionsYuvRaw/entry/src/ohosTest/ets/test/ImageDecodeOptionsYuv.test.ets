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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import fs from '@ohos.file.fs';
import image from '@ohos.multimedia.image';
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import resourceManager from '@ohos.resourceManager';
import common from '@ohos.app.ability.common';
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';

let testContext: common.UIAbilityContext;
let filesDir: string | undefined;

let g_callbackResult = false;

let waitCallback = async () => {
  const date = Date.now();
  while ((Date.now() - date) < 1000) {
    if (g_callbackResult) {
      await sleep(50);
      return;
    } else {
      await sleep(50);
    }
  }
  expect().assertFail();
}

let sleep = async (delay: number): Promise<void> => {
  return new Promise((resolve, _) => {
    setTimeout(async () => {
      resolve();
    }, delay);
  });
};

export default function imageDecodeOptionsYuvTest() {
  describe('ImageDecodeOptionsYuv', () => {
    let filePath: string;
    let globalPixelMap: PixelMap;
    let result: boolean = false;

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
      await sleep(100);
      return imageSourceApi
    }

    const getResult = async (TAG: string, width: number, height: number,
                             desiredPixelFormat: number, serviceName: string,
                             fileName: string, type: string, desiredColorSpace: colorSpaceManager.ColorSpaceManager) => {
      result = false;
      const imageSourceApi = await getImageSource(fileName, type);
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
          desiredDynamicRange: 0
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

    const getResultYuv311 = async (TAG: string, width: number, height: number,
                                   desiredPixelFormat: number, serviceName: string,
                                   fileName: string, type: string, desiredColorSpace: colorSpaceManager.ColorSpaceManager) => {
      result = false;
      const imageSourceApi = await getImageSource(fileName, type);
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
          desiredDynamicRange: 0
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


    const getResultYuv311Null = async (TAG: string, serviceName: string, width: number, height: number,
                                 fileName: string, type: string) => {
      result = false;
      const imageSourceApi = await getImageSource(fileName, type);
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

    const promiseCreate = async (TAG: string, imageSourceApi: image.ImageSource,
                                         decodingOptions: image.DecodingOptions) => {
      await imageSourceApi.createPixelMap(decodingOptions)
        .then(async (pixelMap) => {
          globalPixelMap = pixelMap;
          await pixelMap.getImageInfo().then((imageInfo) => {
            g_callbackResult = true;
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' imageInfo:' + JSON.stringify(imageInfo));
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ` decodingOptions:${JSON.stringify(decodingOptions)};`);
            let colorSpaceManager = decodingOptions.desiredColorSpace as colorSpaceManager.ColorSpaceManager
            let desiredPixelFormat = decodingOptions.desiredPixelFormat
            let desiredSize = decodingOptions.desiredSize as Size
            let fitDensity = decodingOptions.fitDensity
            if (imageInfo.pixelFormat === desiredPixelFormat &&
              imageInfo.size.width === desiredSize.width &&
              imageInfo.size.height === desiredSize.height &&
              imageInfo.density === fitDensity &&
              pixelMap.getColorSpace().getColorSpaceName() === colorSpaceManager.getColorSpaceName()) {
              result = true
            }
            imageSourceApi?.release();
          })
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' getImageInfo err ' + JSON.stringify(err));
        })
    }

    const callBackCreate = async (TAG: string, imageSourceApi: image.ImageSource,
                                  decodingOptions: image.DecodingOptions) => {
    imageSourceApi.createPixelMap(decodingOptions, async (err : BusinessError, pixelMap : image.PixelMap) => {
        if (!err) {
          globalPixelMap = pixelMap;
          await pixelMap.getImageInfo().then((imageInfo) => {
            g_callbackResult = true;
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' imageInfo:' + JSON.stringify(imageInfo));
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ` decodingOptions:${JSON.stringify(decodingOptions)};`);
            let colorSpaceManager = decodingOptions.desiredColorSpace as colorSpaceManager.ColorSpaceManager
            let desiredPixelFormat = decodingOptions.desiredPixelFormat
            let desiredSize = decodingOptions.desiredSize as Size
            let fitDensity = decodingOptions.fitDensity
            if (imageInfo.pixelFormat === desiredPixelFormat &&
              imageInfo.size.width === desiredSize.width &&
              imageInfo.size.height === desiredSize.height &&
              imageInfo.density === fitDensity &&
              pixelMap.getColorSpace().getColorSpaceName() === colorSpaceManager.getColorSpaceName()) {
              result = true
            }
            imageSourceApi?.release();
          })
        } else {
          hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' getImageInfo err ' + JSON.stringify(err));
        }
      })
    }

    const syncCreate = async (TAG: string, imageSourceApi: image.ImageSource,
                                 decodingOptions: image.DecodingOptions) => {
      globalPixelMap = imageSourceApi.createPixelMapSync(decodingOptions)
      await globalPixelMap.getImageInfo().then((imageInfo) => {
        g_callbackResult = true;
        hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' imageInfo:' + JSON.stringify(imageInfo));
        hilog.info(0x0000, 'testTag', '%{public}s', TAG + ` decodingOptions:${JSON.stringify(decodingOptions)};`);
        let colorSpaceManager = decodingOptions.desiredColorSpace as colorSpaceManager.ColorSpaceManager
        let desiredPixelFormat = decodingOptions.desiredPixelFormat
        let desiredSize = decodingOptions.desiredSize as Size
        let fitDensity = decodingOptions.fitDensity
        if (imageInfo.pixelFormat === desiredPixelFormat &&
          imageInfo.size.width === desiredSize.width &&
          imageInfo.size.height === desiredSize.height &&
          imageInfo.density === fitDensity &&
          globalPixelMap.getColorSpace().getColorSpaceName() === colorSpaceManager.getColorSpaceName()) {
          result = true
        }
        imageSourceApi?.release();
      })
    }

    const VerifyPixelMap = async (TAG: string, imageSourceApi: image.ImageSource, width: number, height: number,
                                  decodingOptions: image.DecodingOptions) => {
      globalPixelMap = imageSourceApi.createPixelMapSync(decodingOptions)
      await globalPixelMap.getImageInfo().then((imageInfo) => {
        g_callbackResult = true;
        hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' imageInfo:' + JSON.stringify(imageInfo));
        let desiredPixelFormat = 3
        let fitDensity = 0
        let alphaType = 2
        hilog.info(0x0000, 'testTag', '%{public}s', TAG + ` expectation desiredPixelFormat:${desiredPixelFormat},
        fitDensity:${fitDensity}, alphaType:${alphaType}, width:${width}, height:${height}`);
        if (imageInfo.pixelFormat === desiredPixelFormat &&
          imageInfo.size.width === width &&
          imageInfo.size.height === height &&
          imageInfo.density === fitDensity &&
          imageInfo.alphaType === alphaType) {
          result = true
        }
        imageSourceApi?.release();
      })
    }

    beforeAll(() => {
      filesDir = AppStorage.get('pathDir')
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeAll case');
    })

    beforeEach(() => {
      g_callbackResult = false;
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeEach case');
    })

    afterEach(async () => {
      if (globalPixelMap) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'globalPixelMap release start');
        try {
          await globalPixelMap.release();
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
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0100
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0100
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0100", Level.LEVEL0, async (done: Function) => {
      try{
        await getResult('SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0100',
          240, 180, 8, 'promiseCreate', "test_tree_444.jpg", "buffer",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB));
        await waitCallback()
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0200
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0200
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0200", Level.LEVEL0, async (done: Function) => {
      try{
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0200",
          241, 181, 8, 'promiseCreate', "test_treeodd_440.jpg", "uri",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3));
        await waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0200 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0300
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0300
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0300", Level.LEVEL0, async (done: Function) => {
      try{
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0300",
          240, 150, 8, 'syncCreate', "test_tree_422.jpg", "rawfile",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3));
        await waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0300 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0400
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0400
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0400", Level.LEVEL0, async (done: Function) => {
      try{
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0400",
          241, 151, 8, 'callBackCreate', "test_treeodd_420.jpg", "buffer",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998));
        await waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0400 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0500
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0500
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0500", Level.LEVEL0, async (done: Function) => {
      try{
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0500",
          241, 181, 8, 'callBackCreate', "test_tree_411.jpg", "fd",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB));
        await waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0500 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0600
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0600
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0600", Level.LEVEL0, async (done: Function) => {
      try{
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0600",
          240, 180, 8, 'syncCreate', "test_treeodd_400.jpg", "buffer",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3));
        await waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0600 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0700
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0700
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0700", Level.LEVEL0, async (done: Function) => {
      try{
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0700",
          481, 181, 9, 'syncCreate', "test_tree_444.jpg", "buffer",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3));
        await waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0700 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0800
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0800
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0800", Level.LEVEL0, async (done: Function) => {
      try{
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0800",
          480, 180, 9, 'promiseCreate', "test_treeodd_440.jpg", "uri",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998));
        await waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0800 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0900
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0900
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0900", Level.LEVEL0, async (done: Function) => {
      try{
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0900",
          480, 150, 9, 'promiseCreate', "test_tree_422.jpg", "rawfile",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB));
        await waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0900 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_1000
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_1000
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_1000", Level.LEVEL0, async (done: Function) => {
      try{
        //TODO incremental创建ImageSource目前功能有问题用buffer替代后续替换
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_1000",
          481, 151, 9, 'syncCreate', "test_treeodd_420.jpg", "buffer",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3));
        await waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_1000 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_1100
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_1100
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_1100", Level.LEVEL0, async (done: Function) => {
      try{
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_1100",
          480, 180, 9, 'callBackCreate', "test_tree_411.jpg", "fd",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3));
        await waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_1100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_1200
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_1200
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_1200", Level.LEVEL0, async (done: Function) => {
      try{
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_1200",
          480, 180, 9, 'callBackCreate', "test_treeodd_400.jpg", "buffer",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998));
        await waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_1200 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0100
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0100
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0100", Level.LEVEL0, async (done: Function) => {
      try {
        await getResultYuv311('SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0100',
          480, 360, 8, 'promiseCreate', "JPG-480360-YUV311.jpg", "buffer",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB));
        await waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0200
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0200
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0200", Level.LEVEL0, async (done: Function) => {
      try {
        await getResultYuv311("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0200",
          480, 360, 9, 'callBackCreate', "JPG-480360-YUV311.jpg", "rawfile",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3));
        await waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0200 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0300
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0300
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0300", Level.LEVEL0, async (done: Function) => {
      try {
        await getResultYuv311('SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0300',
          480, 361, 8, 'syncCreate', "JPG-480361-YUV311.jpg", "buffer",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3));
        await waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0300 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0400
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0400
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0400", Level.LEVEL0, async (done: Function) => {
      try {
        await getResultYuv311("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0400",
          480, 361, 9, 'promiseCreate', "JPG-480361-YUV311.jpg", "fd",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998));
        await waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0400 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0500
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0500
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0500", Level.LEVEL0, async (done: Function) => {
      try {
        await getResultYuv311('SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0500',
          481, 360, 8, 'callBackCreate', "JPG-481360-YUV311.jpg", "buffer",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB));
        await waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0500 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0600
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0600
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0600", Level.LEVEL0, async (done: Function) => {
      try {
        await getResultYuv311("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0600",
          481, 360, 9, 'syncCreate', "JPG-481360-YUV311.jpg", "uri",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3));
        await waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0600 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0700
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0700
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0700", Level.LEVEL0, async (done: Function) => {
      try {
        await getResultYuv311('SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0700',
          481, 361, 8, 'promiseCreate', "JPG-480360-YUV311.jpg", "rawfile",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3));
        await waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0700 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0800
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0800
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0800", Level.LEVEL0, async (done: Function) => {
      try {
        await getResultYuv311("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0800",
          481, 361, 9, 'callBackCreate', "JPG-480360-YUV311.jpg", "fd",
          colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998));
        await waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0800 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0900
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0900
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0900", Level.LEVEL0, async (done: Function) => {
      try {
        await getResultYuv311Null("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0900",
          'VerifyPixelMap', 480, 360, "JPG-480360-YUV311.jpg", "buffer");
        await waitCallback()
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_0900 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_1000
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_1000
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_1000", Level.LEVEL0, async (done: Function) => {
      try {
        await getResultYuv311Null("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_1000",
          'VerifyPixelMap', 480, 361, "JPG-480361-YUV311.jpg", "uri");
        await waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_1000 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_1100
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_1100
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_1100", Level.LEVEL0, async (done: Function) => {
      try {
        await getResultYuv311Null("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_1100",
          'VerifyPixelMap', 481, 360, "JPG-481360-YUV311.jpg", "rawfile");
        await waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_1100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_1200
     * @tc.number SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_1200
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_1200", Level.LEVEL0, async (done: Function) => {
      try {
        await getResultYuv311Null("SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_1200",
          'VerifyPixelMap', 481, 361, "JPG-481361-YUV311.jpg", "fd");
        await waitCallback();
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV311_CREATEPIXELMAP_PIXELFORMAT_1200 error:' + e);
        expect().assertFail();
        done();
      }
    });
  })
}
