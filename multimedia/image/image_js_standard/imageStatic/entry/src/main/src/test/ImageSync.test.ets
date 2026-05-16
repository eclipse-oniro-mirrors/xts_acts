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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, DEFAULT, Hypium, Level } from '../../../hypium/index';
import fs from '@ohos.file.fs';
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import { initialize } from './AbilityContextHelper.test';
import colorSpaceManager from '@ohos.graphics.colorSpaceManager'
import { BusinessError } from '@ohos.base';

class Logger {
  testNum: string;

  constructor(testNum: string) {
    this.testNum = testNum;
  }

  log(msg: string) {
    hilog.info(0x0000, "imagePicture", 'case: %{public}s msg:%{public}s', this.testNum, msg);
  }
}

export default function imageSync() {
  describe('imageSync', (): void => {
    let filesDir: string | undefined | null;
    let filePath: string;
    let fdNumber: double;

    let globalpixelmap: image.PixelMap | undefined = undefined;
    let globalimageSource: image.ImageSource | undefined = undefined;
    beforeAll(() => {
      await initialize();
      filesDir = Hypium.get('filesDir') as string | undefined | null;
    })

    afterEach(async () => {
      if (globalimageSource != undefined) {
        console.info('globalimageSource release start');
        try {
          await globalimageSource!.release();
        } catch (error) {
          console.info('globalimageSource release fail');
        }
      }
      if (globalpixelmap != undefined) {
        console.info('globalpixelmap release start');
        try {
          await globalpixelmap!.release();
        } catch (error) {
          console.info('globalpixelmap release fail');
        }
      }
      console.info('afterEach case');
    });

    const getFd = (fileName: string): int => {
      filePath = filesDir + "/" + fileName;
      console.info("image filePath:" + filePath);
      const file = fs.openSync(filePath);
      return file.fd as int;
    };

    const getBuffer = (fileName: string) => {
      const filePath = filesDir + '/' + fileName;
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead)
      return bufferRead;
    }

    const testGetImageInfo = async (
      done: () => void,
      testNum: string,
      fileName: string,
      imageWidth: int,
      imageHeight: int,
      mimeType: string,
      index: int | null
    ) => {
      let logger = new Logger(testNum);
      try {
        let fd: int = getFd(fileName);
        const imageSourceApi = image.createImageSource(fd);
        if (imageSourceApi == undefined) {
          expect(false).assertTrue();
          logger.log('create image source failed');
          done();
        } else {
          globalimageSource = imageSourceApi;
          logger.log('create image source success');
          let imageInfo: image.ImageInfo | undefined;
          if (index != null) {
            imageInfo = imageSourceApi.getImageInfoSync(index);
          } else {
            imageInfo = imageSourceApi.getImageInfoSync();
          }
          if (imageInfo == undefined) {
            logger.log('getImageInfoSync return undefined');
            expect(false).assertTrue();
            done();
          } else {
            logger.log(imageInfo + 'imageInfo 000 ');
            expect(imageInfo != undefined).assertTrue();
            expect(imageInfo!.size.width).assertEqual(imageWidth);
            expect(imageInfo!.size.height).assertEqual(imageHeight);
            expect(imageInfo!.density == 0).assertTrue();
            expect(imageInfo!.stride == 0).assertTrue();
            expect(imageInfo!.pixelFormat == 0).assertTrue();
            expect(imageInfo!.alphaType == 0).assertTrue();
            expect(imageInfo!.mimeType).assertEqual(mimeType);
            logger.log('imageInfo: ');
            logger.log('imageInfo.size.width: ' + imageInfo.size.width);
            logger.log('imageInfo.size.height: ' + imageInfo.size.height);
            logger.log('imageInfo.density: ' + imageInfo.density);
            logger.log('imageInfo.stride: ' + imageInfo.stride);
            logger.log('imageInfo.pixelFormat: ' + imageInfo.pixelFormat);
            logger.log('imageInfo.alphaType: ' + imageInfo.alphaType);
            logger.log('imageInfo.mimeType: ' + imageInfo.mimeType);
            logger.log('success');
            done();
          }
        }
      } catch (error) {
        logger.log("getImageInfoSync error: " + error);
        expect(false).assertTrue();
        done();
      }
    }

    const getImageInfoInvaildIndex = async (
      done: () => void,
      testNum: string,
      fileName: string,
      index: int
    ) => {
      try {
        let fd: int = getFd(fileName);
        const imageSourceApi = image.createImageSource(fd);
        if (imageSourceApi == undefined) {
          console.info(`${testNum} create image source failed`);
          expect(false).assertTrue();
          done();
        } else {
          let imageInfo = imageSourceApi.getImageInfoSync(index);
          expect(imageInfo == undefined).assertTrue();
          console.info(`${testNum} success`);
          done();
        }
      } catch (error) {
        console.info(`${testNum} error: ` + error);
        expect(false).assertTrue();
        done();
      }
    }

    const testCreateIncrementalSourcePixelMap = async(
      done: () => void,
      testNum: string,
      fileName: string,
    ) => {
      try {
        let testimagebuffer = getBuffer(fileName);
        console.info(`${testNum} start image buffer length: ` + testimagebuffer.byteLength);
        let bufferSize = testimagebuffer.byteLength;
        let offset: int = 0;
        const incSouce: image.ImageSource | undefined = image.createIncrementalSource(new ArrayBuffer(1));
        let ret: boolean;
        let isFinished: boolean = false;
        while (offset < testimagebuffer.byteLength) {
          let oneStep = testimagebuffer.slice(offset, offset + bufferSize);
          console.info(`${testNum} one step length: ` + oneStep.byteLength);
          if (oneStep.byteLength < bufferSize) {
            isFinished = true;
          }
          try {
            if (incSouce == undefined) {
              console.info(`${testNum} createIncrementalSource failed`);
              ret = false;
              expect(false).assertTrue();
              done();
            } else {
              await incSouce!.updateData(oneStep, isFinished, 0, oneStep.byteLength as int);
              offset = offset + oneStep.byteLength as int;
              console.info(`${testNum} offset: ` + offset);
              ret = true;
            }
          } catch (error) {
            console.info(`${testNum} updateData failed`);
            expect(false).assertTrue();
            ret = false;
          }
        }
        if (ret && incSouce != undefined) {
          console.info(`${testNum} updateData success`);
          let decodingOptions: image.DecodingOptions = {
            sampleSize: 1
          };
          let pixelmap = incSouce!.createPixelMapSync(decodingOptions);
          console.info(`${testNum} pixelmap: ` + pixelmap);
          expect(pixelmap != undefined).assertTrue();
          globalpixelmap = pixelmap;
          done();
        } else {
          done();
        }
      } catch (error) {
        console.info(`${testNum} error: ` + error);
      }
    }

    const testCreatePixelMap = (
      done: () => void,
      testNum: string,
      fileName: string,
      opts: image.DecodingOptions
    ) => {
      let logger = new Logger(testNum);
      try {
        let fd: int = getFd(fileName);
        const imageSourceApi = image.createImageSource(fd);
        if (imageSourceApi == undefined) {
          expect(false).assertTrue();
          logger.log('create image source failed');
          done();
        } else {
          globalimageSource = imageSourceApi;
          if (opts.desiredSize == undefined) {
            let size: image.Size ={ width: 1446, height: 1476 };
            opts.desiredSize = size;
          }
          let pixelMap = imageSourceApi.createPixelMapSync(opts);
          if (pixelMap == undefined) {
            expect(false).assertTrue();
            logger.log('create pixelmap failed');
            done();
          } else {
            globalpixelmap = pixelMap;
            let pixelMapInfo = await pixelMap.getImageInfo();
            let pixelColorSpace = pixelMap.getColorSpace().getColorSpaceName();
            let pixelGamma = pixelMap.getColorSpace().getGamma();
            logger.log('pixelmap info:');
            expect(pixelMap != undefined).assertTrue();
            expect(pixelMapInfo.size.width == opts?.desiredSize?.width).assertTrue();
            expect(pixelMapInfo.size.height == opts?.desiredSize?.height).assertTrue();
            expect(pixelMapInfo.pixelFormat == opts.desiredPixelFormat).assertTrue();
            expect(pixelMap.isEditable == opts.editable).assertTrue();
            expect(pixelMap.getDensity() == opts.fitDensity).assertTrue();
            expect(pixelColorSpace == opts?.desiredColorSpace?.getColorSpaceName()
              || pixelColorSpace == colorSpaceManager.ColorSpace.CUSTOM).assertTrue();
            expect(pixelGamma == opts?.desiredColorSpace?.getGamma()).assertTrue();
            logger.log('pixelmap width: ' + pixelMapInfo.size.width);
            logger.log('pixelmap height: ' + pixelMapInfo.size.height);
            logger.log('pixelmap editable: ' + pixelMap.isEditable);
            logger.log('pixelmap pixel format: ' + pixelMapInfo.pixelFormat);
            logger.log('pixelmap density: ' + pixelMap.getDensity());
            logger.log('pixelmap color space name: ' + pixelColorSpace);
            logger.log('pixelmap color space gamma: ' + pixelGamma);
            logger.log('createPixelMapSync success');
            done();
          }
        }
      } catch (error: BusinessError) {
        logger.log('createPixelMapSync error' + error);
        expect(false).assertTrue();
        done();
      }
    }

    const createPixelMapInvaildOpt = async(
      done: () => void,
      testNum: string,
      fileName: string,
      opts: image.DecodingOptions
    ) => {
      try {
        let fd: int = getFd(fileName);
        const imageSourceApi = image.createImageSource(fd);
        if (imageSourceApi == undefined) {
          console.info(`${testNum} create image source failed`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${testNum} create pixelmap failed with invalid options`);
          globalpixelmap = imageSourceApi.createPixelMapSync(opts);
          expect(globalpixelmap == undefined).assertTrue();
          console.info(`${testNum} success`);
          done();
        }
      } catch (error) {
        console.info(`${testNum} error: ` + error);
        expect(false).assertTrue();
        done();
      }
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0100
     * @tc.desc   test all information with getImageInfoSync for jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testGetImageInfo(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0100", "test.jpg", 1446, 1476, "image/jpeg", 0);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0200
     * @tc.desc   test all information with getImageInfoSync for bmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testGetImageInfo(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0200", "test.bmp", 1399, 1042, "image/bmp", 0);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0300
     * @tc.desc   test all information with getImageInfoSync for png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testGetImageInfo(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0300", "test.png", 6016, 3384, "image/png", 0);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0400
     * @tc.desc   test all information with getImageInfoSync for gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testGetImageInfo(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0400", "test.gif", 6016, 3384, "image/gif", 0);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0500
     * @tc.desc   test all information with getImageInfoSync for dng
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testGetImageInfo(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0500", "test.dng", 5976, 3992, "image/x-adobe-dng", 0);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0600
     * @tc.desc   test all information with getImageInfoSync for webp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testGetImageInfo(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0600", "test_large.webp", 1212, 681,
        "image/webp", 0);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0700
     * @tc.desc   test all information with getImageInfoSync for svg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testGetImageInfo(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0700", "test_large.svg", 2136, 1968,
        "image/svg+xml", 0);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0800
     * @tc.desc   test all information with getImageInfoSync for ico
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testGetImageInfo(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0800", "test.ico", 64, 64, "image/x-icon", 0);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0900
     * @tc.desc   test getImageInfoSync for wrong suffix image
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testGetImageInfo(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_STATIC_0900", "test.123", 6016, 3384, "image/bmp", 0);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_STATIC_0100
     * @tc.desc   test getImageInfoSync with index1 for one frame gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
        await getImageInfoInvaildIndex(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_STATIC_0100", "test.gif", 1);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_STATIC_0200
     * @tc.desc   test getImageInfoSync with index-1 for one frame gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
        await getImageInfoInvaildIndex(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_STATIC_0200", "test.gif", -1);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_STATIC_0300
     * @tc.desc   test getImageInfoSync with index1 for gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testGetImageInfo(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_STATIC_0300", "moving_test.gif", 198, 202,
        "image/gif", 1);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_STATIC_0400
     * @tc.desc   test getImageInfoSync with index1 for one frame webp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
        await getImageInfoInvaildIndex(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_STATIC_0400", "test_large.webp", 1);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_STATIC_0500
     * @tc.desc   test getImageInfoSync with index1 for webp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testGetImageInfo(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_STATIC_0500", "moving_test.webp", 658, 494,
        "image/webp", 1);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_STATIC_0600
     * @tc.desc   test getImageInfoSync with index null for jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_STATIC_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testGetImageInfo(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEINFOSYNC_INDEX_STATIC_0600", "test.jpg", 1446, 1476,
        "image/jpeg", null);
    });


    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0100
     * @tc.desc   test createPixelMapSync with buffer data png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testCreateIncrementalSourcePixelMap(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0100", "test.png");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0200
     * @tc.desc   test createPixelMapSync with buffer data jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testCreateIncrementalSourcePixelMap(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0200", "test.jpg");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0300
     * @tc.desc   test createPixelMapSync with decodingOption index0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
        let csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998)
        let desired_size: image.Size ={ width: 100, height: 20 };
        let region_size: image.Size ={ width: 1, height: 2 };
        let region: image.Region = { size: region_size, x: 0, y: 0};
        let decodingOptions: image.DecodingOptions = {
          sampleSize: 1,
          editable: true,
          desiredSize: desired_size,
          rotate: 10,
          desiredPixelFormat: image.PixelMapFormat.RGB_565,
          desiredRegion: region,
          fitDensity: 240,
          index: 0,
          desiredColorSpace: csm,
          desiredDynamicRange: image.DecodingDynamicRange.AUTO
        };
        testCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0300", "test.jpg", decodingOptions);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0400
     * @tc.desc   test createPixelMapSync with decodingOption index-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
        let decodingOptions: image.DecodingOptions = {
            index: -1,
            sampleSize: 1,
            rotate: 10,
            editable: true,
            desiredSize: {
                width: 1, height: 2
            },
            desiredRegion: {
                size: {
                    height: 1, width: 2
                }, x: 0, y: 0
            },
            desiredPixelFormat: image.PixelMapFormat.RGB_565,
            fitDensity: 240
        };
        createPixelMapInvaildOpt(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0400", "test.jpg", decodingOptions);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0500
     * @tc.desc   test createPixelMapSync with decodingOption sampleSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
        let csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3);
        let desired_size: image.Size = { width: 100, height: 20 };
        let region_size: image.Size = { width: 1, height: 2 };
        let region: image.Region = { size: region_size, x: 0, y: 0};
        let decodingOptions: image.DecodingOptions = {
            index: 0,
            sampleSize: 1,
            rotate: 10,
            editable: true,
            desiredSize: desired_size,
            desiredRegion: region,
            desiredPixelFormat: image.PixelMapFormat.RGB_565,
            fitDensity: 240,
            desiredColorSpace: csm
        };
        testCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0500", "test.jpg", decodingOptions);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0600
     * @tc.desc   test createPixelMapSync with decodingOption rotate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
        let csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3);
        let desired_size: image.Size ={ width: 10, height: 10 };
        let region_size: image.Size ={ width: 10, height: 10 };
        let region: image.Region = { size: region_size, x: 0, y: 0};
        let decodingOptions: image.DecodingOptions = {
            index: 0,
            sampleSize: 1,
            rotate: 30,
            editable: true,
            desiredSize: desired_size,
            desiredRegion: region,
            desiredPixelFormat: image.PixelMapFormat.RGB_565,
            fitDensity: 200,
            desiredColorSpace: csm
        };
        testCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0600", "test.jpg", decodingOptions);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0700
     * @tc.desc   test createPixelMapSync with decodingOption editable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
        let csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB);
        let desired_size: image.Size ={ width: 10, height: 10 };
        let region_size: image.Size ={ width: 10, height: 10 };
        let region: image.Region = { size: region_size, x: 1, y: 1};
        let decodingOptions: image.DecodingOptions = {
            index: 0,
            sampleSize: 1,
            rotate: 30,
            editable: false,
            desiredSize: desired_size,
            desiredRegion: region,
            desiredPixelFormat: image.PixelMapFormat.RGB_565,
            fitDensity: 200,
            desiredColorSpace: csm
        };
        testCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0700", "test.jpg", decodingOptions);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0800
     * @tc.desc   test createPixelMapSync with decodingOption desiredSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
        let csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB);
        let desired_size: image.Size ={ width: 10, height: 20 };
        let region_size: image.Size ={ width: 10, height: 20 };
        let region: image.Region = { size: region_size, x: 0, y: 0};
        let decodingOptions: image.DecodingOptions = {
            index: 0,
            sampleSize: 1,
            rotate: 50,
            editable: false,
            desiredSize: desired_size,
            desiredRegion: region,
            desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
            fitDensity: 150,
            desiredColorSpace: csm
        };
        testCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0800", "test.jpg", decodingOptions);
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0900
     * @tc.desc   test createPixelMapSync with decodingOption desiredRegion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
        let primaries: colorSpaceManager.ColorSpacePrimaries = {
            redX: 0.64,
            redY: 0.33,
            greenX: 0.3,
            greenY: 0.6,
            blueX: 0.15,
            blueY: 0.06,
            whitePointX: 0.3127,
            whitePointY: 0.3290
        };
        let csm = colorSpaceManager.create(primaries, 2.875);
        let desired_size: image.Size ={ width: 1, height: 2 };
        let region_size: image.Size ={ width: 1, height: 2 };
        let region: image.Region = { size: region_size, x: 0, y: 0};
        let decodingOptions: image.DecodingOptions = {
            index: 0,
            sampleSize: 1,
            rotate: 50,
            editable: false,
            desiredSize: desired_size,
            desiredRegion: region,
            desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
            fitDensity: 150,
            desiredColorSpace: csm
        };
        testCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_0900", "test.jpg", decodingOptions);
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_1000
     * @tc.desc   test createPixelMapSync with decodingOption desiredPixelFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
        let csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998_LIMIT);
        let desired_size: image.Size ={ width: 10, height: 20 };
        let region_size: image.Size ={ width: 1, height: 2 };
        let region: image.Region = { size: region_size, x: 30, y: 30};
        let decodingOptions: image.DecodingOptions = {
            index: 0,
            sampleSize: 1,
            rotate: 70,
            editable: false,
            desiredSize: desired_size,
            desiredRegion: region,
            desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
            fitDensity: 100,
            desiredColorSpace: csm
        };
        testCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_1000", "test.jpg", decodingOptions);
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_1100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_1100
     * @tc.desc   test createPixelMapSync with decodingOption fitDensity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
        let csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_SRGB);
        let desired_size: image.Size ={ width: 10, height: 20 };
        let region_size: image.Size ={ width: 30, height: 30 };
        let region: image.Region = { size: region_size, x: 30, y: 30};
        let decodingOptions: image.DecodingOptions = {
            index: 0,
            sampleSize: 1,
            rotate: 70,
            editable: false,
            desiredSize: desired_size,
            desiredRegion: region,
            desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
            fitDensity: 100,
            desiredColorSpace: csm
        };
        testCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_1100", "test.jpg", decodingOptions);
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_1200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_1200
     * @tc.desc   test createPixelMapSync with decodingOption desiredColorSpace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
        let csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_SRGB);
        let decodingOptions: image.DecodingOptions = {
            index: 0,
            sampleSize: 1,
            editable: false,
            desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
            fitDensity: 50,
            desiredColorSpace: csm
        };
        testCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_1200", "test.jpg", decodingOptions);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_1300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_1300
     * @tc.desc   test createPixelMapSync with decodingOption null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAPSYNC_STATIC_1300");
      try {
        let fd: int = getFd("test.jpg");
        const imageSourceApi = image.createImageSource(fd);
        if (imageSourceApi == undefined) {
          expect(false).assertTrue();
          logger.log('create image source failed');
          done();
        } else {
          globalimageSource = imageSourceApi;
          let csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB);
          let desired_size: image.Size ={ width: 1446, height: 1476 };
          let opts: image.DecodingOptions = {
            editable: false,
            desiredSize: desired_size,
            desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
            fitDensity: 0,
            desiredColorSpace: csm
          };
          globalpixelmap = imageSourceApi.createPixelMapSync();
          if (globalpixelmap == undefined) {
            expect(false).assertTrue();
            logger.log('create pixelmap failed');
            done();
          } else {
            let pixelMapInfo = await globalpixelmap!.getImageInfo();
            let pixelColorSpace = globalpixelmap!.getColorSpace().getColorSpaceName();
            let pixelGamma = globalpixelmap!.getColorSpace().getGamma();
            logger.log('pixelmap info:');
            expect(globalpixelmap != undefined).assertTrue();
            expect(pixelMapInfo.size.width == opts?.desiredSize?.width).assertTrue();
            expect(pixelMapInfo.size.height == opts?.desiredSize?.height).assertTrue();
            expect(pixelMapInfo.pixelFormat == opts.desiredPixelFormat).assertTrue();
            expect(globalpixelmap!.isEditable == opts.editable).assertTrue();
            expect(globalpixelmap!.getDensity() == opts.fitDensity).assertTrue();
            expect(pixelColorSpace == opts?.desiredColorSpace?.getColorSpaceName()
              || pixelColorSpace == colorSpaceManager.ColorSpace.CUSTOM).assertTrue();
            expect(pixelGamma == opts?.desiredColorSpace?.getGamma()).assertTrue();
            logger.log('pixelmap width: ' + pixelMapInfo.size.width);
            logger.log('pixelmap height: ' + pixelMapInfo.size.height);
            logger.log('pixelmap pixel format: ' + pixelMapInfo.pixelFormat);
            logger.log('pixelmap editable: ' + globalpixelmap!.isEditable);
            logger.log('pixelmap density: ' + globalpixelmap!.getDensity());
            logger.log('pixelmap color space name: ' + pixelColorSpace);
            logger.log('pixelmap color space gamma: ' + pixelGamma);
            logger.log('createPixelMapSync success');
            done();
          }
        }
      } catch (error: BusinessError) {
        logger.log('createPixelMapSync error' + error);
        expect(false).assertTrue();
        done();
      }
    });


  })
}

