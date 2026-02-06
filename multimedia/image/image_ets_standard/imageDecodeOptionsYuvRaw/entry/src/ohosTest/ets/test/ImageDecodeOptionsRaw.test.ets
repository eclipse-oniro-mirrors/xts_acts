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
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';
import common from '@ohos.app.ability.common';

let testContext: common.UIAbilityContext;

interface newImageInfoSize {
  width?: number,
  height?: number,
}

interface newImageInfo {
  size?: newImageInfoSize,
  pixelFormat?: number,
  colorSpace?: number,
  alphaType?: number,
  density?: number,
  stride?: number,
}

let sleep = async (delay: number): Promise<void> => {
  return new Promise((resolve, _) => {
    setTimeout(async () => {
      resolve();
    }, delay);
  });
};

export default function imageDecodeOptionsRawTest() {
  describe('ImageDecodeOptionsRaw', () => {
    beforeAll(async () => {
      filesDir = AppStorage.get('pathDir')
    })

    let globalPixelMap: PixelMap;
    let result: boolean = false;

    let filePath: string;
    let fdNumber: number;
    let filesDir:string|undefined

    const getFd = async (fileName: string) => {
      filePath = filesDir + '/' +fileName;
      console.log('filePath:', filePath)
      let file = fs.openSync(filePath);
      fdNumber = file.fd;
    }

    const getResult = async (TAG: string, index: number, sampleSize: number, rotate: number, editable:boolean,
                             desiredSize: image.Size, desiredRegion: image.Region, desiredPixelFormat: number,
                             fitDensity: number, desiredColorSpace: colorSpaceManager.ColorSpaceManager,
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

    const decodingOptionsCreate = async (TAG: string, imageSourceApi:  image.ImageSource,
                                         decodingOptions: image.DecodingOptions, desiredPixelFormat: number) => {
      result = false;
      await imageSourceApi.createPixelMap(decodingOptions)
        .then(async (pixelMap) => {
          globalPixelMap = pixelMap;
          await pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
            let imageInfoStr = JSON.stringify(imageInfo);
            let zheImageInfo: newImageInfo = JSON.parse(imageInfoStr) as newImageInfo;
            let pixelFormat = zheImageInfo?.pixelFormat
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' decodingOptionsCreate pixelFormat:' + pixelFormat);
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' imageInfo:' + JSON.stringify(imageInfo));
            pixelFormat === desiredPixelFormat && (result = true);
            pixelMap.release();
            imageSourceApi.release();
          })
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' getImageInfo err ' + JSON.stringify(err));
        })    
    }

    const callBackCreate = async (TAG: string, imageSourceApi: image.ImageSource,
                                  decodingOptions: image.DecodingOptions, desiredPixelFormat: number) => {
      result = false;
      imageSourceApi.createPixelMap(decodingOptions, async (err: BusinessError, pixelMap: image.PixelMap) => {
        if (!err) {
          globalPixelMap = pixelMap;
          await pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
            let imageInfoStr = JSON.stringify(imageInfo);
            let zheImageInfo: newImageInfo = JSON.parse(imageInfoStr) as newImageInfo;
            let pixelFormat = zheImageInfo?.pixelFormat
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' callBackCreate pixelFormat:' + pixelFormat);
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' imageInfo:' + JSON.stringify(imageInfo));
            pixelFormat === desiredPixelFormat && (result = true);
            pixelMap.release();
            imageSourceApi.release();
          })
        } else {
          hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' getImageInfo err ' + JSON.stringify(err));
        }
      })
    }

    const getResult_F16 = async (TAG: string, index: number, sampleSize: number, rotate: number, editable:boolean,
                             desiredSize: image.Size, desiredRegion: image.Region, desiredPixelFormat: number,
                             fitDensity: number, desiredColorSpace: colorSpaceManager.ColorSpaceManager,
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

    const decodingOptionsCreate_F16 = async (TAG: string, imageSourceApi: image.ImageSource,
                                         decodingOptions: image.DecodingOptions, desiredPixelFormat: number) => {
      result = false;
      await imageSourceApi.createPixelMap(decodingOptions)
        .then(async (pixelMap) => {
          globalPixelMap = pixelMap;
          await pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
            let imageInfoStr = JSON.stringify(imageInfo);
            let zheImageInfo: newImageInfo = JSON.parse(imageInfoStr) as newImageInfo;
            let pixelFormat = zheImageInfo?.pixelFormat
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' decodingOptionsCreate pixelFormat:' + pixelFormat);
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' imageInfo:' + JSON.stringify(imageInfo));
            pixelFormat === 3 && (result = true);
            pixelMap.release();
            imageSourceApi.release();
          })
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' getImageInfo err ' + JSON.stringify(err));
        })
    }

    const callBackCreate_F16 = async (TAG: string, imageSourceApi: image.ImageSource,
                                  decodingOptions: image.DecodingOptions, desiredPixelFormat: number) => {
      result = false;
      imageSourceApi.createPixelMap(decodingOptions, async (err: BusinessError, pixelMap: image.PixelMap) => {
        if (!err) {
          globalPixelMap = pixelMap;
          await pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
            let imageInfoStr = JSON.stringify(imageInfo);
            let zheImageInfo: newImageInfo = JSON.parse(imageInfoStr) as newImageInfo;
            let pixelFormat = zheImageInfo?.pixelFormat
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' callBackCreate pixelFormat:' + pixelFormat);
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' imageInfo:' + JSON.stringify(imageInfo));
            pixelFormat === 3 && (result = true);
            pixelMap.release();
            imageSourceApi.release();
          })
        } else {
          hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' getImageInfo err ' + JSON.stringify(err));
        }
      })
    }
    
    beforeAll(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeAll case');
    })

    beforeEach(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeEach case');
    })

    afterEach(async () => {
      fs.closeSync(fdNumber);
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
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0100
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0100", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0100', 0, 1, 90, true, Size, Region, 2,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0200
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0200", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0200', 0, 1, 90, true, Size, Region, 2,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0200 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0300
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0300", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0300', 0, 1, 90, true, Size, Region, 2,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0300 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0400
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0400", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0400', 0, 1, 90, true, Size, Region, 2,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0400 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0500
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0500", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0500', 0, 1, 90, true, Size, Region, 2,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0500 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0600
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0600", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0600', 0, 1, 90, true, Size, Region, 2,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0600 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0700
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0700", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0700', 0, 1, 90, true, Size, Region, 2,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0700 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0800
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0800", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0800', 0, 1, 90, true, Size, Region, 2,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0800 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0900
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0900", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0900', -1, 1, 90, true, Size, Region, 2,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_0900 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1000
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1000", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1000', -1, 1, 90, true, Size, Region, 2,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1000 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1100
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1100", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1100', 0, -1, 90, true, Size, Region, 2,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1200
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1200", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1200', 0, -1, 90, true, Size, Region, 2,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1200 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1300
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1300", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1300', 0, 1, -1, true, Size, Region, 2,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1300 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1400
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1400", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1400', 0, 1, -1, true, Size, Region, 2,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1400 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1500
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1500", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { height: -548, width: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1500', 0, 1, 90, true, Size, Region, 2,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1500 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1600
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1600", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { height: -548, width: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1600', 0, 1, 90, true, Size, Region, 2,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1600 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1700
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1700", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { height: 548, width: -730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1700', 0, 1, 90, true, Size, Region, 2,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1700 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1800
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1800", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { height: 548, width: -730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1800', 0, 1, 90, true, Size, Region, 2,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1800 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1900
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1900", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: -1, y: 0, size: { height: 2, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1900', 0, 1, 90, true, Size, Region, 2,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_1900 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2000
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2000", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: -1, y: 0, size: { height: 2, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2000', 0, 1, 90, true, Size, Region, 2,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2000 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2100
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2100", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: -1, size: { height: 2, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2100', 0, 1, 90, true, Size, Region, 2,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2200
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2200", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: -1, size: { height: 2, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2200', 0, 1, 90, true, Size, Region, 2,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2200 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2300
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2300", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: -1, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2300', 0, 1, 90, true, Size, Region, 2,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2300 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2400
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2400", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: -1, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2400', 0, 1, 90, true, Size, Region, 2,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2400 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2500
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2500", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 2, width: -1 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2500', 0, 1, 90, true, Size, Region, 2,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2500 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2600
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2600", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 2, width: -1 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2600', 0, 1, 90, true, Size, Region, 2,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2600 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2700
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2700", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2700', 0, 1, 90, true, Size, Region, 2,
          -100, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2700 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2800
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2800", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2800', 0, 1, 90, true, Size, Region, 2,
          -100, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGB565_CREATEPIXELMAP_2800 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0100
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0100", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0100', 0, 1, 90, true, Size, Region, 3,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0200
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0200", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0200', 0, 1, 90, true, Size, Region, 3,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0200 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0300
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0300", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0300', 0, 1, 90, true, Size, Region, 3,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0300 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0400
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0400", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0400', 0, 1, 90, true, Size, Region, 3,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0400 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0500
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0500", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0500', 0, 1, 90, true, Size, Region, 3,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0500 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0600
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0600", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0600', 0, 1, 90, true, Size, Region, 3,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0600 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0700
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0700", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0700', 0, 1, 90, true, Size, Region, 3,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0700 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0800
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0800", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0800', 0, 1, 90, true, Size, Region, 3,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0800 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0900
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0900", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0900', -1, 1, 90, true, Size, Region, 3,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_0900 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1000
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1000", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1000', -1, 1, 90, true, Size, Region, 3,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1000 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1100
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1100", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1100', 0, -1, 90, true, Size, Region, 3,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1200
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1200", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1200', 0, -1, 90, true, Size, Region, 3,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1200 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1300
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1300", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1300', 0, 1, -1, true, Size, Region, 3,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1300 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1400
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1400", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1400', 0, 1, -1, true, Size, Region, 3,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1400 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1500
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1500", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { height: -548, width: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1500', 0, 1, 90, true, Size, Region, 3,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1500 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1600
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1600", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { height: -548, width: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1600', 0, 1, 90, true, Size, Region, 3,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1600 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1700
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1700", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { height: 548, width: -730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1700', 0, 1, 90, true, Size, Region, 3,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1700 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1800
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1800", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { height: 548, width: -730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1800', 0, 1, 90, true, Size, Region, 3,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1800 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1900
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1900", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: -1, y: 0, size: { height: 2, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1900', 0, 1, 90, true, Size, Region, 3,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_1900 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2000
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2000", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: -1, y: 0, size: { height: 2, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2000', 0, 1, 90, true, Size, Region, 3,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2000 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2100
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2100", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: -1, size: { height: 2, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2100', 0, 1, 90, true, Size, Region, 3,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2200
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2200", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: -1, size: { height: 2, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2200', 0, 1, 90, true, Size, Region, 3,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2200 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2300
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2300", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: -1, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2300', 0, 1, 90, true, Size, Region, 3,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2300 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2400
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2400", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: -1, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2400', 0, 1, 90, true, Size, Region, 3,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2400 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2500
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2500", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 2, width: -1 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2500', 0, 1, 90, true, Size, Region, 3,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2500 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2600
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2600", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 2, width: -1 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2600', 0, 1, 90, true, Size, Region, 3,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2600 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2700
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2700", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2700', 0, 1, 90, true, Size, Region, 3,
          -100, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2700 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2800
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2800", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2800', 0, 1, 90, true, Size, Region, 3,
          -100, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBA8888_CREATEPIXELMAP_2800 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0100
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0100", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0100', 0, 1, 90, true, Size, Region, 4,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0200
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0200", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0200', 0, 1, 90, true, Size, Region, 4,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0200 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0300
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0300", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0300', 0, 1, 90, true, Size, Region, 4,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0300 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0400
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0400", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0400', 0, 1, 90, true, Size, Region, 4,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0400 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0500
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0500", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0500', 0, 1, 90, true, Size, Region, 4,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0500 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0600
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0600", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0600', 0, 1, 90, true, Size, Region, 4,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0600 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0700
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0700", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0700', 0, 1, 90, true, Size, Region, 4,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0700 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0800
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0800", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0800', 0, 1, 90, true, Size, Region, 4,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0800 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0900
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0900", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0900', -1, 1, 90, true, Size, Region, 4,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_0900 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1000
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1000", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1000', -1, 1, 90, true, Size, Region, 4,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1000 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1100
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1100", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1100', 0, -1, 90, true, Size, Region, 4,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1200
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1200", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1200', 0, -1, 90, true, Size, Region, 4,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1200 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1300
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1300", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1300', 0, 1, -1, true, Size, Region, 4,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1300 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1400
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1400", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1400', 0, 1, -1, true, Size, Region, 4,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1400 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1500
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1500", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { height: -548, width: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1500', 0, 1, 90, true, Size, Region, 4,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1500 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1600
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1600", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { height: -548, width: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1600', 0, 1, 90, true, Size, Region, 4,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1600 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1700
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1700", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { height: 548, width: -730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1700', 0, 1, 90, true, Size, Region, 4,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1700 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1800
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1800", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { height: 548, width: -730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1800', 0, 1, 90, true, Size, Region, 4,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1800 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1900
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1900", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: -1, y: 0, size: { height: 2, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1900', 0, 1, 90, true, Size, Region, 4,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_1900 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2000
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2000", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: -1, y: 0, size: { height: 2, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2000', 0, 1, 90, true, Size, Region, 4,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2000 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2100
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2100", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: -1, size: { height: 2, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2100', 0, 1, 90, true, Size, Region, 4,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2200
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2200", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: -1, size: { height: 2, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2200', 0, 1, 90, true, Size, Region, 4,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2200 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2300
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2300", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: -1, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2300', 0, 1, 90, true, Size, Region, 4,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2300 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2400
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2400", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: -1, width: 3 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2400', 0, 1, 90, true, Size, Region, 4,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2400 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2500
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2500", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 2, width: -1 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2500', 0, 1, 90, true, Size, Region, 4,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2500 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2600
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2600", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 2, width: -1 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2600', 0, 1, 90, true, Size, Region, 4,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2600 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2700
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2700", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2700', 0, 1, 90, true, Size, Region, 4,
          -100, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2700 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2800
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2800", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult('SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2800', 0, 1, 90, true, Size, Region, 4,
          -100, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_BGRA8888_CREATEPIXELMAP_2800 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0100
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0100", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0100', 0, 1, 90, true, Size, Region, 7,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0200
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0200", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0200', 0, 1, 90, true, Size, Region, 7,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0200 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0300
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0300", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0300', 0, 1, 90, true, Size, Region, 7,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0300 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0400
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0400", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0400', 0, 1, 90, true, Size, Region, 7,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0400 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0500
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0500", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0500', 0, 1, 90, true, Size, Region, 7,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0500 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0600
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0600", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0600', 0, 1, 90, true, Size, Region, 7,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0600 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0700
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0700", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0700', 0, 1, 90, true, Size, Region, 7,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0700 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0800
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0800", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0800', 0, 1, 90, true, Size, Region, 7,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0800 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0900
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0900", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0900', -1, 1, 90, true, Size, Region, 7,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_0900 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1000
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1000", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1000', -1, 1, 90, true, Size, Region, 7,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1000 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1100
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1100", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1100', 0, -1, 90, true, Size, Region, 7,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1200
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1200", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1200', 0, -1, 90, true, Size, Region, 7,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1200 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1300
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1300", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1300', 0, 1, -1, true, Size, Region, 7,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1300 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1400
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1400", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1400', 0, 1, -1, true, Size, Region, 7,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1400 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1500
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1500", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { height: -548, width: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1500', 0, 1, 90, true, Size, Region, 7,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1500 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1600
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1600", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { height: -548, width: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1600', 0, 1, 90, true, Size, Region, 7,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1600 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1700
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1700", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { height: 548, width: -730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1700', 0, 1, 90, true, Size, Region, 7,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1700 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1800
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1800", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { height: 548, width: -730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1800', 0, 1, 90, true, Size, Region, 7,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1800 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1900
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1900", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: -1, y: 0, size: { height: 2, width: 3 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1900', 0, 1, 90, true, Size, Region, 7,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_1900 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2000
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2000", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: -1, y: 0, size: { height: 2, width: 3 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2000', 0, 1, 90, true, Size, Region, 7,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2000 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2100
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2100", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: -1, size: { height: 2, width: 3 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2100', 0, 1, 90, true, Size, Region, 7,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2200
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2200", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: -1, size: { height: 2, width: 3 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2200', 0, 1, 90, true, Size, Region, 7,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertFalse();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2200 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2300
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2300", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: -1, width: 3 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2300', 0, 1, 90, true, Size, Region, 7,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2300 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2400
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2400", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: -1, width: 3 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2400', 0, 1, 90, true, Size, Region, 7,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2400 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2500
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2500", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 2, width: -1 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2500', 0, 1, 90, true, Size, Region, 7,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2500 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2600
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2600", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 2, width: -1 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2600', 0, 1, 90, true, Size, Region, 7,
          120, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2600 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     *
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2700
     * @tc.name      : createPixelMap(decodingOptions)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2700", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2700', 0, 1, 90, true, Size, Region, 7,
          -100, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2700 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2800
     * @tc.name      : createPixelMap(decodingOptions, asyncCallback)-DNG
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2800", Level.LEVEL0, async (done: Function) => {
      await getFd("test2.arw");
      try {
        let Size : image.Size = { width: 548, height: 730 };
        let Region : image.Region = { x: 0, y: 0, size: { height: 80, width: 120 } };
        await getResult_F16('SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2800', 0, 1, 90, true, Size, Region, 7,
          -100, colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB), 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_RGBAF16_CREATEPIXELMAP_2800 error:' + e);
        expect().assertFail();
        done();
      }
    });
  })
}
