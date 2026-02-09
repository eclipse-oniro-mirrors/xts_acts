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
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';
import common from '@ohos.app.ability.common';
import { initialize } from './AbilityContextHelper.test';

let testContext: common.UIAbilityContext;

let sleep = async (count:int) : Promise<int> => {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, count)
  })
}

export default function imageDecodeOptionsRawTest() {
  describe('ImageDecodeOptionsRaw', () => {
    let globalPixelMap: image.PixelMap | undefined = undefined;
    let result: boolean = false;

    let filePath: string;
    let fdNumber: int;
    let filesDir: string | undefined | null;

    const RGB_565 = image.PixelMapFormat.RGB_565;

    const getFd = async (fileName: string) => {
      filePath = filesDir + '/' +fileName;
      console.log('filePath:', filePath)
      let file = fs.openSync(filePath);
      fdNumber = file.fd as int;
    }

    const decodingOptionsCreate = async (TAG: string, imageSourceApi:  image.ImageSource,
      decodingOptions: image.DecodingOptions, desiredPixelFormat: image.PixelMapFormat) => {
      result = false;
      try{ 
          let pixelMap: image.PixelMap | undefined = await imageSourceApi.createPixelMap(decodingOptions);
          if (pixelMap == undefined) {
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' pixelMap == undefined');
          } else {
            globalPixelMap = pixelMap;
            let imageInfo: image.ImageInfo = await pixelMap.getImageInfo();
            if (imageInfo == undefined) {
              hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' imageInfo == undefined');
            }
            expect(imageInfo != undefined).assertTrue();
            let pixelFormat = imageInfo.pixelFormat;
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' decodingOptionsCreate pixelFormat:' + pixelFormat);
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' imageInfo:' + JSON.stringify(imageInfo));
            pixelFormat === desiredPixelFormat && (result = true);
            if (pixelMap != undefined) {
              pixelMap.release();
            }
            await imageSourceApi.release();
          }
        } catch(err) {
          hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' getImageInfo err ' + JSON.stringify(err));
          await imageSourceApi.release();
        }
    }

    const callBackCreate = async (TAG: string, imageSourceApi: image.ImageSource,
      decodingOptions: image.DecodingOptions, desiredPixelFormat: image.PixelMapFormat) => {
      result = false;
      imageSourceApi.createPixelMap(decodingOptions, (err: BusinessError|null, pixelMap: image.PixelMap|undefined) => {
        if (err && err.code) {
          hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' getImageInfo err ' + JSON.stringify(err));
          await imageSourceApi.release();
        } else {
          globalPixelMap = pixelMap!;
          let imageInfo = await pixelMap!.getImageInfo();
          expect(imageInfo != undefined).assertTrue();
          let pixelFormat = imageInfo.pixelFormat;
          hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' callBackCreate pixelFormat:' + pixelFormat);
          hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' imageInfo:' + JSON.stringify(imageInfo));
          pixelFormat === desiredPixelFormat && (result = true);
          pixelMap!.release();
          await imageSourceApi.release();
        }
      })
    }

    const getResult = async (TAG: string, index: int, sampleSize: int, rotate: int, editable: boolean,
      desiredSize: image.Size, desiredRegion: image.Region, desiredPixelFormat: image.PixelMapFormat,
      fitDensity: int, desiredColorSpace: colorSpaceManager.ColorSpaceManager,
      serviceName: string) => {
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info(TAG + " create image source failed");
      } else {
        let decodingOptions: image.DecodingOptions = {
          index: index,
          sampleSize: sampleSize,
          rotate: rotate,
          editable: editable,
          desiredSize: desiredSize,
          desiredRegion: desiredRegion,
          desiredPixelFormat: desiredPixelFormat,
          fitDensity: fitDensity,
          desiredColorSpace: desiredColorSpace,
        };
        switch (serviceName) {
          case 'decodingOptions':
            await decodingOptionsCreate(TAG, imageSourceApi, decodingOptions, desiredPixelFormat);
            break
          case 'callBackCreate':
            await callBackCreate(TAG, imageSourceApi, decodingOptions, desiredPixelFormat);
            await sleep(5000);
            break
        }
        await sleep(1000);
      }
    }

    const decodingOptionsCreate_F16 = async (TAG: string, imageSourceApi: image.ImageSource,
      decodingOptions: image.DecodingOptions, desiredPixelFormat: image.PixelMapFormat) => {
      result = false;
      try {
        let pixelMap: image.PixelMap | undefined = await imageSourceApi.createPixelMap(decodingOptions);
        if (pixelMap == undefined) {
          hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' pixelMap == undefined');
        } else {
          globalPixelMap = pixelMap;
          let imageInfo: image.ImageInfo = await pixelMap.getImageInfo();
          expect(imageInfo != undefined).assertTrue();
          if (imageInfo == undefined) {
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' imageInfo == undefined');
          }
          let pixelFormat = imageInfo.pixelFormat;
          hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' decodingOptionsCreate pixelFormat:' + pixelFormat);
          hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' imageInfo:' + JSON.stringify(imageInfo));
          pixelFormat === image.PixelMapFormat.RGBA_8888 && (result = true);
          if (pixelMap != undefined) {
            pixelMap.release();
          }
	        await imageSourceApi.release();
        }
      } catch(err) {
        hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' getImageInfo err ' + JSON.stringify(err));
        await imageSourceApi.release();
      }
    }

    const callBackCreate_F16 = async (TAG: string, imageSourceApi: image.ImageSource,
      decodingOptions: image.DecodingOptions, desiredPixelFormat: image.PixelMapFormat) => {
      result = false;
      imageSourceApi.createPixelMap(decodingOptions, (err: BusinessError|null, pixelMap: image.PixelMap|undefined) => {
        if (err && err.code) {
          hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' getImageInfo err ' + JSON.stringify(err));
          await imageSourceApi.release();
        } else {
          globalPixelMap = pixelMap!;
          let imageInfo = await pixelMap!.getImageInfo();
          expect(imageInfo != undefined).assertTrue();
          if (imageInfo != undefined) {
            let pixelFormat = imageInfo.pixelFormat;
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' callBackCreate pixelFormat:' + pixelFormat);
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' imageInfo:' + JSON.stringify(imageInfo));
            pixelFormat === image.PixelMapFormat.RGBA_8888 && (result = true);
          }
          pixelMap!.release();
          await imageSourceApi.release();
        }
      })
    }

    const getResult_F16 = async (TAG: string, index: int, sampleSize: int, rotate: int, editable:boolean,
      desiredSize: image.Size, desiredRegion: image.Region, desiredPixelFormat: image.PixelMapFormat,
      fitDensity: int, desiredColorSpace: colorSpaceManager.ColorSpaceManager,
      serviceName: string) => {
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info(TAG + " create image source failed");
      } else {
        let decodingOptions: image.DecodingOptions = {
          index: index,
          sampleSize: sampleSize,
          rotate: rotate,
          editable: editable,
          desiredSize: desiredSize,
          desiredRegion: desiredRegion,
          desiredPixelFormat: desiredPixelFormat,
          fitDensity: fitDensity,
          desiredColorSpace: desiredColorSpace,
        };
        switch (serviceName) {
          case 'decodingOptions':
            await decodingOptionsCreate_F16(TAG, imageSourceApi, decodingOptions, desiredPixelFormat);
            break
          case 'callBackCreate':
            await callBackCreate_F16(TAG, imageSourceApi, decodingOptions, desiredPixelFormat);
            await sleep(5000);
            break
        }
        await sleep(1000);
      }
    }

    beforeAll(() => {
      await initialize();
      filesDir = Hypium.get('filesDir') as string | undefined | null;
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeAll case');
    })

    beforeEach(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeEach case');
    })

    afterEach(async () => {
      fs.closeSync(fdNumber);
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
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0100
     * @tc.number SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0100
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0100', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGB_565,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0200
     * @tc.number SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0200
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0200', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGB_565,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0200 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0300
     * @tc.number SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0300
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0300', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGB_565,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0300 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0400
     * @tc.number SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0400
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0400', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGB_565,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0400 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0500
     * @tc.number SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0500
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0500', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGB_565,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0500 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0600
     * @tc.number SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0600
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0600", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0600', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGB_565,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0600 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0700
     * @tc.number SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0700
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0700", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0700', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGB_565,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0700 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0800
     * @tc.number SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0800
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0800", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0800', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGB_565,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0800 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0900
     * @tc.number SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0900
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0900", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0900', -1, 1, 90, true, Size, Region, image.PixelMapFormat.RGB_565,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_0900 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1000
     * @tc.number SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1000
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1000", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1000', -1, 1, 90, true, Size, Region, image.PixelMapFormat.RGB_565,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1000 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1100
     * @tc.number SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1100
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1100', 0, -1, 90, true, Size, Region, image.PixelMapFormat.RGB_565,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1200
     * @tc.number SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1200
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1200', 0, -1, 90, true, Size, Region, image.PixelMapFormat.RGB_565,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1200 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1300
     * @tc.number SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1300
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1300', 0, 1, -1, true, Size, Region, image.PixelMapFormat.RGB_565,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1300 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1400
     * @tc.number SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1400
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1400', 0, 1, -1, true, Size, Region, image.PixelMapFormat.RGB_565,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1400 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1500
     * @tc.number SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1500
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { height: -548, width: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1500', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGB_565,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1500 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1600
     * @tc.number SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1600
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1600", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { height: -548, width: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1600', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGB_565,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1600 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1700
     * @tc.number SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1700
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1700", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { height: 548, width: -730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1700', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGB_565,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1700 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1800
     * @tc.number SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1800
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1800", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { height: 548, width: -730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1800', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGB_565,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1800 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1900
     * @tc.number SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1900
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1900", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: -1, y: 0, size: { height: 2, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1900', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGB_565,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_1900 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2000
     * @tc.number SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2000
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2000", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: -1, y: 0, size: { height: 2, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2000', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGB_565,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2000 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2100
     * @tc.number SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2100
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: -1, size: { height: 2, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2100', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGB_565,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2200
     * @tc.number SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2200
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: -1, size: { height: 2, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2200', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGB_565,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2200 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2300
     * @tc.number SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2300
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: -1, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2300', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGB_565,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2300 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2400
     * @tc.number SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2400
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: -1, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2400', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGB_565,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2400 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2500
     * @tc.number SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2500
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 2, width: -1 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2500', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGB_565,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2500 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2600
     * @tc.number SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2600
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2600", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 2, width: -1 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2600', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGB_565,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2600 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2700
     * @tc.number SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2700
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2700", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2700', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGB_565,
          -100, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2700 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2800
     * @tc.number SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2800
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2800", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2800', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGB_565,
          -100, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_STATIC_2800 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0100
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0100
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0100', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0200
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0200
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0200', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0200 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0300
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0300
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0300', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0300 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0400
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0400
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0400', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0400 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0500
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0500
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0500', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0500 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0600
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0600
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0600", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0600', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0600 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0700
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0700
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0700", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0700', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0700 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0800
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0800
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0800", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0800', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0800 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0900
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0900
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0900", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0900', -1, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_0900 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1000
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1000
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1000", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1000', -1, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1000 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1100
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1100
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1100', 0, -1, 90, true, Size, Region, image.PixelMapFormat.RGBA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1200
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1200
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1200', 0, -1, 90, true, Size, Region, image.PixelMapFormat.RGBA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1200 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1300
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1300
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1300', 0, 1, -1, true, Size, Region, image.PixelMapFormat.RGBA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1300 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1400
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1400
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1400', 0, 1, -1, true, Size, Region, image.PixelMapFormat.RGBA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1400 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1500
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1500
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { height: -548, width: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1500', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1500 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1600
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1600
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1600", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { height: -548, width: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1600', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1600 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1700
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1700
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1700", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { height: 548, width: -730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1700', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1700 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1800
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1800
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1800", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { height: 548, width: -730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1800', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1800 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1900
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1900
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1900", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: -1, y: 0, size: { height: 2, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1900', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_1900 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2000
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2000
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2000", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: -1, y: 0, size: { height: 2, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2000', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2000 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2100
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2100
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: -1, size: { height: 2, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2100', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2200
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2200
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: -1, size: { height: 2, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2200', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2200 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2300
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2300
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: -1, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2300', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2300 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2400
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2400
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: -1, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2400', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2400 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2500
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2500
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 2, width: -1 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2500', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2500 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2600
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2600
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2600", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 2, width: -1 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2600', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2600 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2700
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2700
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2700", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2700', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_8888,
          -100, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2700 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2800
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2800
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2800", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2800', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_8888,
          -100, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_STATIC_2800 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0100
     * @tc.number SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0100
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0100', 0, 1, 90, true, Size, Region, image.PixelMapFormat.BGRA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0200
     * @tc.number SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0200
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0200', 0, 1, 90, true, Size, Region, image.PixelMapFormat.BGRA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0200 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0300
     * @tc.number SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0300
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0300', 0, 1, 90, true, Size, Region, image.PixelMapFormat.BGRA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0300 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0400
     * @tc.number SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0400
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0400', 0, 1, 90, true, Size, Region, image.PixelMapFormat.BGRA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0400 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0500
     * @tc.number SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0500
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0500', 0, 1, 90, true, Size, Region, image.PixelMapFormat.BGRA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0500 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0600
     * @tc.number SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0600
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0600", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0600', 0, 1, 90, true, Size, Region, image.PixelMapFormat.BGRA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0600 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0700
     * @tc.number SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0700
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0700", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0700', 0, 1, 90, true, Size, Region, image.PixelMapFormat.BGRA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0700 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0800
     * @tc.number SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0800
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0800", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0800', 0, 1, 90, true, Size, Region, image.PixelMapFormat.BGRA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0800 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0900
     * @tc.number SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0900
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0900", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0900', -1, 1, 90, true, Size, Region, image.PixelMapFormat.BGRA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_0900 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1000
     * @tc.number SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1000
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1000", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1000', -1, 1, 90, true, Size, Region, image.PixelMapFormat.BGRA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1000 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1100
     * @tc.number SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1100
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1100', 0, -1, 90, true, Size, Region, image.PixelMapFormat.BGRA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1200
     * @tc.number SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1200
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1200', 0, -1, 90, true, Size, Region, image.PixelMapFormat.BGRA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1200 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1300
     * @tc.number SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1300
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1300', 0, 1, -1, true, Size, Region, image.PixelMapFormat.BGRA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1300 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1400
     * @tc.number SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1400
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1400', 0, 1, -1, true, Size, Region, image.PixelMapFormat.BGRA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1400 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1500
     * @tc.number SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1500
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { height: -548, width: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1500', 0, 1, 90, true, Size, Region, image.PixelMapFormat.BGRA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1500 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1600
     * @tc.number SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1600
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1600", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { height: -548, width: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1600', 0, 1, 90, true, Size, Region, image.PixelMapFormat.BGRA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1600 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1700
     * @tc.number SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1700
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1700", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { height: 548, width: -730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1700', 0, 1, 90, true, Size, Region, image.PixelMapFormat.BGRA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1700 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1800
     * @tc.number SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1800
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1800", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { height: 548, width: -730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1800', 0, 1, 90, true, Size, Region, image.PixelMapFormat.BGRA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1800 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1900
     * @tc.number SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1900
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1900", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: -1, y: 0, size: { height: 2, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1900', 0, 1, 90, true, Size, Region, image.PixelMapFormat.BGRA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_1900 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2000
     * @tc.number SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2000
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2000", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: -1, y: 0, size: { height: 2, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2000', 0, 1, 90, true, Size, Region, image.PixelMapFormat.BGRA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2000 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2100
     * @tc.number SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2100
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: -1, size: { height: 2, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2100', 0, 1, 90, true, Size, Region, image.PixelMapFormat.BGRA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2200
     * @tc.number SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2200
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: -1, size: { height: 2, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2200', 0, 1, 90, true, Size, Region, image.PixelMapFormat.BGRA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2200 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2300
     * @tc.number SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2300
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: -1, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2300', 0, 1, 90, true, Size, Region, image.PixelMapFormat.BGRA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2300 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2400
     * @tc.number SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2400
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: -1, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2400', 0, 1, 90, true, Size, Region, image.PixelMapFormat.BGRA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2400 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2500
     * @tc.number SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2500
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 2, width: -1 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2500', 0, 1, 90, true, Size, Region, image.PixelMapFormat.BGRA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2500 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2600
     * @tc.number SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2600
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2600", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 2, width: -1 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2600', 0, 1, 90, true, Size, Region, image.PixelMapFormat.BGRA_8888,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2600 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2700
     * @tc.number SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2700
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2700", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2700', 0, 1, 90, true, Size, Region, image.PixelMapFormat.BGRA_8888,
          -100, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2700 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2800
     * @tc.number SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2800
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2800", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2800', 0, 1, 90, true, Size, Region, image.PixelMapFormat.BGRA_8888,
          -100, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_STATIC_2800 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0100
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0100
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0100', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_F16,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0200
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0200
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0200', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_F16,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0200 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0300
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0300
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0300', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_F16,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0300 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0400
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0400
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0400', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_F16,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0400 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0500
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0500
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0500', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_F16,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0500 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0600
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0600
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0600", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0600', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_F16,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0600 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0700
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0700
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0700", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0700', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_F16,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0700 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0800
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0800
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0800", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0800', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_F16,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0800 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0900
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0900
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0900", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0900', -1, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_F16,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_0900 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1000
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1000
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1000", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1000', -1, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_F16,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1000 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1100
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1100
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1100', 0, -1, 90, true, Size, Region, image.PixelMapFormat.RGBA_F16,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1200
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1200
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1200', 0, -1, 90, true, Size, Region, image.PixelMapFormat.RGBA_F16,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1200 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1300
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1300
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1300', 0, 1, -1, true, Size, Region, image.PixelMapFormat.RGBA_F16,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1300 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1400
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1400
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1400', 0, 1, -1, true, Size, Region, image.PixelMapFormat.RGBA_F16,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1400 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1500
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1500
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { height: -548, width: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1500', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_F16,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1500 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1600
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1600
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1600", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { height: -548, width: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1600', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_F16,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1600 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1700
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1700
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1700", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { height: 548, width: -730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1700', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_F16,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1700 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1800
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1800
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1800", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { height: 548, width: -730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1800', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_F16,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1800 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1900
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1900
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1900", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: -1, y: 0, size: { height: 2, width: 3 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1900', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_F16,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_1900 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2000
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2000
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2000", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: -1, y: 0, size: { height: 2, width: 3 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2000', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_F16,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2000 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2100
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2100
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: -1, size: { height: 2, width: 3 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2100', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_F16,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2200
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2200
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: -1, size: { height: 2, width: 3 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2200', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_F16,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2200 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2300
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2300
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: -1, width: 3 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2300', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_F16,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2300 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2400
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2400
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: -1, width: 3 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2400', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_F16,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2400 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2500
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2500
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 2, width: -1 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2500', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_F16,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2500 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2600
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2600
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2600", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 2, width: -1 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2600', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_F16,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2600 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2700
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2700
     * @tc.desc   createPixelMap(decodingOptions)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2700", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2700', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_F16,
          -100, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2700 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2800
     * @tc.number SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2800
     * @tc.desc   createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2800", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2800', 0, 1, 90, true, Size, Region, image.PixelMapFormat.RGBA_F16,
          -100, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_STATIC_2800 error:' + e);
        expect().assertFail();
        done();
      }
    });
  })
}






