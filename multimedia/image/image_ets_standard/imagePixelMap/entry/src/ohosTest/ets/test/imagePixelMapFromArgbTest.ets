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
import { describe, beforeAll, afterEach, it, expect, Level, Size, TestType } from '@ohos/hypium';
import image from '@ohos.multimedia.image';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import hdrCapability from '@ohos.graphics.hdrCapability';
import display from '@ohos.display';

export default function imagePixelmapArgb() {
  let filesDir: string|undefined;
  let cacheDir: string|undefined;
  let testContext: common.UIAbilityContext;
  let isSupportHEIFDecode: boolean;
  let isSupportHEICEncode: boolean;
  let isSupportHdr: Boolean;
  const ARGB_8888 = image.PixelMapFormat.ARGB_8888;
  const RGBA_8888 = image.PixelMapFormat.RGBA_8888;
  const RGBA_1010102 = image.PixelMapFormat.RGBA_1010102;
  const UNSUPPORTED_ALLOCATOR_TYPE = 7700201;
  describe('imagePixelMapFromArgbTest', () => {
    beforeAll(async () => {
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      filesDir = AppStorage.get('pathDir')
      cacheDir = AppStorage.get('cacheDir')
      isSupportHEIFDecode =
        image.createImageSource(filesDir + '/' + "testExif.jpg").supportedFormats.includes("image/heic");
      isSupportHEICEncode = 
        image.createImagePacker().supportedFormats.includes("image/heic");
      isSupportHdr = 
        !display.getDefaultDisplaySync().hdrFormats.includes(hdrCapability.HDRFormat.NONE) &&
          display.getDefaultDisplaySync().hdrFormats.length != 0;
    })

    afterEach(async () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'afterEach case');
    });

    class Logger {
      testNum: string;
  
      constructor(testNum: string) {
        this.testNum = testNum;
      }
  
      log(msg: string) {
        hilog.info(0x0000, "imagePixelmap", 'case: %{public}s msg:%{public}s', this.testNum, msg);
      }
    }

    const getBuffer = async (fileName: string) => {
      const filePath = filesDir + '/' + fileName;
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead);
      fs.closeSync(file.fd);
      return bufferRead;
    }

    const getImageInfoFromAllocator = async (
      logger: Logger,
      buffer: ArrayBuffer,
      decodingOptions: image.DecodingOptions,
      allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY
    ) => {
      let imageSource = image.createImageSource(buffer);
      let pixelMap: image.PixelMap | undefined = undefined;
      pixelMap = await imageSource.createPixelMapUsingAllocator(decodingOptions, allocatorType);
      let imageInfo = await pixelMap.getImageInfo();
      logger.log("getImageInfo is: " + JSON.stringify(imageInfo));
      await pixelMap.release();
      return imageInfo;
    }

    const getImageInfo = async (
      logger: Logger,
      buffer: ArrayBuffer,
      decodingOptions: image.DecodingOptions
    ) => {
      let imageSource = image.createImageSource(buffer);
      let pixelMap: image.PixelMap | undefined = undefined;
      pixelMap = await imageSource.createPixelMap(decodingOptions);
      let imageInfo = await pixelMap.getImageInfo();
      logger.log("getImageInfo is: " + JSON.stringify(imageInfo));
      await pixelMap.release();
      return imageInfo;
    }

    const getPixelmap = async (
      logger: Logger,
      buffer: ArrayBuffer,
      decodingOptions?: image.DecodingOptions
    ) => {
      let imageSource = image.createImageSource(buffer);
      let pixelMap = imageSource.createPixelMap(decodingOptions);
      if (pixelMap == undefined) {
        logger.log('Failed to create pixelMap.');
      }
      await imageSource.release();
      return pixelMap;
    }

    const getPixelmapFromAllocator = async (
      logger: Logger,
      buffer: ArrayBuffer,
      decodingOptions?: image.DecodingOptions
    ) => {
      let imageSource = image.createImageSource(buffer);
      let pixelMap = await imageSource.createPixelMapUsingAllocator(decodingOptions, image.AllocatorType.SHARE_MEMORY);
      if (pixelMap == undefined) {
        logger.log('Failed to create pixelMap.');
      }
      await imageSource.release();
      return pixelMap;
    }

    const getFdCacheDir = async (fileName: string) => {
      const uri: string = cacheDir + '/' + fileName;
      const file: fs.File = fs.openSync(uri, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      return file.fd;
    }

    const testPackPixelmap =  async (
      done: Function,
      logger: Logger,
      packOpts: image.PackingOption,
      packType: string,
      pixelMap: image.PixelMap,
      inputFormat: image.PixelMapFormat,
      fdNum: number = 0
    ) => {
      logger.log("test pack pixelmap start !!");
      const imagePackerApi: image.ImagePacker = image.createImagePacker();
      if (packType === "packing") {
        await imagePackerApi.packing(pixelMap, packOpts).then(async (data: ArrayBuffer) => {
          let imageSource = image.createImageSource(data);
          let ret = await checkPixelmap(done, logger, imageSource, inputFormat);
          expect(ret).assertTrue();
          await pixelMap.release();
          done();
        }).catch(async (error: BusinessError) => {
          logger.log(`packing pixelMap to buffer failed: ${error}, error code: ${JSON.stringify(error.code)}`);
          expect(false).assertTrue();
          await pixelMap.release();
          done();
        })
      } else {
        await imagePackerApi.packToFile(pixelMap, fdNum, packOpts).then(async () => {
          let imageSource = image.createImageSource(fdNum);
          let ret = await checkPixelmap(done, logger, imageSource, inputFormat);
          await fs.close(fdNum);
          expect(ret).assertTrue();
          await pixelMap.release();
          done();
        }).catch(async (error: BusinessError) => {
          logger.log(`packToFile pixelMap failed: ${error}, error code: ${JSON.stringify(error.code)}`);
          expect(false).assertTrue();
          await pixelMap.release();
          done();
        });
      }
    }

    const checkPixelmap = async (
      done: Function,
      logger: Logger,
      imageSource: image.ImageSource,
      inputFormat: image.PixelMapFormat,
    ): Promise<boolean> => {
      let ret = false;
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 500, height: 500},
        desiredPixelFormat: inputFormat
      };
      let pixelmap = await imageSource.createPixelMap(decodingOptions);
      if(pixelmap != undefined) {
        let imageInfo = await pixelmap.getImageInfo();
        ret = (imageInfo.pixelFormat == inputFormat);
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        await pixelmap.release();
      } else {
        logger.log("pixelmap is undefined");
        expect(false).assertTrue();
        done();
      }
      await imageSource.release();
      logger.log("check pixelmap result is: " + ret);
      return ret;
    }

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_0100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.set DecodingOptions
     *                       desiredPixelFormat: ARGB_8888
     *                 3.get ImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_0100");
      const buffer = await getBuffer("test.png");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 350, height: 350},
        desiredPixelFormat: ARGB_8888
      };
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      expect(imageInfo.pixelFormat == ARGB_8888).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_0200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.set DecodingOptions
     *                       desiredPixelFormat: ARGB_8888
     *                 3.get ImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_0200");
      const buffer = await getBuffer("testExif.jpg");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 200, height: 200},
        desiredPixelFormat: ARGB_8888
      };
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      expect(imageInfo.pixelFormat == ARGB_8888).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_0300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.set DecodingOptions
     *                       desiredPixelFormat: ARGB_8888
     *                 3.get ImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_0300");
      const buffer = await getBuffer("test.bmp");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 500, height: 500},
        desiredPixelFormat: ARGB_8888
      };
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      expect(imageInfo.pixelFormat == ARGB_8888).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_0400
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.set DecodingOptions
     *                       desiredPixelFormat: ARGB_8888
     *                 3.get ImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_0400");
      const buffer = await getBuffer("test.gif");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 500, height: 500},
        desiredPixelFormat: ARGB_8888
      };
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      expect(imageInfo.pixelFormat == ARGB_8888).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_0500
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.set DecodingOptions
     *                       desiredPixelFormat: ARGB_8888
     *                 3.get ImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_0500");
      const buffer = await getBuffer("test.webp");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 500, height: 500},
        desiredPixelFormat: ARGB_8888
      };
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      expect(imageInfo.pixelFormat == ARGB_8888).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_0600
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.set DecodingOptions
     *                       desiredPixelFormat: ARGB_8888
     *                 3.get ImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_0600");
      const buffer = await getBuffer("test.ico");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 500, height: 500},
        desiredPixelFormat: ARGB_8888
      };
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      expect(imageInfo.pixelFormat == ARGB_8888).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_0700
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.set DecodingOptions
     *                       desiredPixelFormat: ARGB_8888
     *                 3.get ImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_0700");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        const buffer = await getBuffer("test_dng.dng");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 500, height: 500},
          desiredPixelFormat: ARGB_8888
        };
        let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
        expect(imageInfo.pixelFormat == ARGB_8888).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_0800
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.set DecodingOptions
     *                       desiredPixelFormat: ARGB_8888
     *                 3.get ImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_0800");
        const buffer = await getBuffer("test.svg");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 500, height: 500},
          desiredPixelFormat: ARGB_8888
        };
        let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
        expect(imageInfo.pixelFormat == ARGB_8888).assertTrue();
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_0900
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.set DecodingOptions
     *                       desiredPixelFormat: ARGB_8888
     *                 3.get ImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_0900");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        const buffer = await getBuffer("CUVAHdrMulti.jpg");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 500, height: 500},
          desiredPixelFormat: ARGB_8888,
          desiredDynamicRange: image.DecodingDynamicRange.HDR
        };
        let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
        expect(imageInfo.pixelFormat == RGBA_1010102).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PACKING_0100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredPixelFormat: ARGB_8888
     *                 3.set PackingOption
     *                 4.test pixelmap packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PACKING_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PACKING_0100");
      const buffer = await getBuffer("testExif.jpg");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 500, height: 500},
        desiredPixelFormat: ARGB_8888
      };
      let pixelMap = await getPixelmap(logger, buffer, decodingOptions);
      let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
      };
      await testPackPixelmap(done, logger, packOpts, 'packing', pixelMap, ARGB_8888);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PACKING_0200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredPixelFormat: ARGB_8888
     *                 3.set PackingOption
     *                 4.test pixelmap packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PACKING_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PACKING_0200");
      if (!isSupportHEICEncode) {
        logger.log("device is not support heic encode!");
        expect(true).assertTrue();
        done();
      } else {
        const buffer = await getBuffer("test.svg");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 500, height: 500},
          desiredPixelFormat: ARGB_8888
        };
        let pixelMap = await getPixelmap(logger, buffer, decodingOptions);
        let packOpts: image.PackingOption = {
          format: "image/heic",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPixelmap(done, logger, packOpts, 'packing', pixelMap, ARGB_8888);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PACKING_0300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredPixelFormat: ARGB_8888
     *                 3.set PackingOption
     *                 4.test pixelmap packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PACKING_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PACKING_0300");
      const buffer = await getBuffer("test.gif");
      let DecodingOptions: image.DecodingOptions = {
        desiredSize: {width: 500, height: 500},
        desiredPixelFormat: ARGB_8888
      };
      let pixelMap = await getPixelmap(logger, buffer, DecodingOptions);
      let packOpts: image.PackingOption = {
           format: "image/gif",
          quality: 100,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
      };
      await testPackPixelmap(done, logger, packOpts, 'packing', pixelMap, RGBA_8888);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PACKTOFILE_0100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredPixelFormat: ARGB_8888
     *                 3.set PackingOption
     *                 4.test pixelmap packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PACKTOFILE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PACKTOFILE_0100");
      const buffer = await getBuffer("test.webp");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 500, height: 500},
        desiredPixelFormat: ARGB_8888
      };
      let pixelMap = await getPixelmap(logger, buffer, decodingOptions);
      let packOpts: image.PackingOption = {
          format: "image/webp",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
      };
      const fdNum = await getFdCacheDir("pack_pixelmap_01.webp");
      await testPackPixelmap(done, logger, packOpts, 'packtofile', pixelMap, ARGB_8888, fdNum);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PACKTOFILE_0200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredPixelFormat: ARGB_8888
     *                 3.set PackingOption
     *                 4.test pixelmap packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PACKTOFILE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PACKTOFILE_0200");
      const buffer = await getBuffer("test.png");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 500, height: 500},
        desiredPixelFormat: ARGB_8888
      };
      let pixelMap = await getPixelmap(logger, buffer, decodingOptions);
      let packOpts: image.PackingOption = {
          format: "image/png",
          quality: 100,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
      };
      const fdNum = await getFdCacheDir("pack_pixelmap_01.png");
      await testPackPixelmap(done, logger, packOpts, 'packtofile', pixelMap, RGBA_8888, fdNum);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_0100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.set DecodingOptions
     *                       desiredPixelFormat: ARGB_8888
     *                 3.get ImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_0100");
      const buffer = await getBuffer("test.png");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 350, height: 350},
        desiredPixelFormat: ARGB_8888
      };
      let imageInfo = await getImageInfoFromAllocator(logger, buffer, decodingOptions);
      expect(imageInfo.pixelFormat == ARGB_8888).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_0200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.set DecodingOptions
     *                       desiredPixelFormat: ARGB_8888
     *                 3.get ImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_0200");
      const buffer = await getBuffer("testExif.jpg");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 500, height: 500},
        desiredPixelFormat: ARGB_8888
      };
      let imageInfo = await getImageInfoFromAllocator(logger, buffer, decodingOptions);
      expect(imageInfo.pixelFormat == ARGB_8888).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_0300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.set DecodingOptions
     *                       desiredPixelFormat: ARGB_8888
     *                 3.get ImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_0300");
      const buffer = await getBuffer("test.bmp");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 500, height: 500},
        desiredPixelFormat: ARGB_8888
      };
      let imageInfo = await getImageInfoFromAllocator(logger, buffer, decodingOptions);
      expect(imageInfo.pixelFormat == ARGB_8888).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_0400
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.set DecodingOptions
     *                       desiredPixelFormat: ARGB_8888
     *                 3.get ImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_0400");
      const buffer = await getBuffer("test.gif");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 500, height: 500},
        desiredPixelFormat: ARGB_8888
      };
      let imageInfo = await getImageInfoFromAllocator(logger, buffer, decodingOptions);
      expect(imageInfo.pixelFormat == ARGB_8888).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_0500
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.set DecodingOptions
     *                       desiredPixelFormat: ARGB_8888
     *                 3.get ImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_0500");
      const buffer = await getBuffer("test.webp");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 500, height: 500},
        desiredPixelFormat: ARGB_8888
      };
      let imageInfo = await getImageInfoFromAllocator(logger, buffer, decodingOptions);
      expect(imageInfo.pixelFormat == ARGB_8888).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_0600
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.set DecodingOptions
     *                       desiredPixelFormat: ARGB_8888
     *                 3.get ImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_0600");
      const buffer = await getBuffer("test.ico");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 500, height: 500},
        desiredPixelFormat: ARGB_8888
      };
      let imageInfo = await getImageInfoFromAllocator(logger, buffer, decodingOptions);
      expect(imageInfo.pixelFormat == ARGB_8888).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_0700
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.set DecodingOptions
     *                       desiredPixelFormat: ARGB_8888
     *                 3.get ImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_0700");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        const buffer = await getBuffer("test_dng.dng");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 500, height: 500},
          desiredPixelFormat: ARGB_8888
        };
        let imageInfo = await getImageInfoFromAllocator(logger, buffer, decodingOptions);
        expect(imageInfo.pixelFormat == ARGB_8888).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_0800
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.set DecodingOptions
     *                       desiredPixelFormat: ARGB_8888
     *                 3.get ImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_0800");
        const buffer = await getBuffer("test.svg");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 500, height: 500},
          desiredPixelFormat: ARGB_8888
        };
        let imageInfo = await getImageInfoFromAllocator(logger, buffer, decodingOptions);
        expect(imageInfo.pixelFormat == ARGB_8888).assertTrue();
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_0900
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.set DecodingOptions
     *                       desiredPixelFormat: ARGB_8888
     *                 3.get ImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_0900");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        const buffer = await getBuffer("CUVAHdrMulti.jpg");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 500, height: 500},
          desiredPixelFormat: ARGB_8888,
          desiredDynamicRange: image.DecodingDynamicRange.HDR
        };
        let imageSource = image.createImageSource(buffer);
        let pixelMap = await imageSource.createPixelMapUsingAllocator(decodingOptions, image.AllocatorType.DMA);
        let imageInfo = await pixelMap.getImageInfo();
        expect(imageInfo.pixelFormat == RGBA_1010102).assertTrue();
        await imageSource.release();
        await pixelMap.release();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_1000
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.set DecodingOptions
     *                       desiredPixelFormat: ARGB_8888
     *                 3.get ImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_1000");
        const buffer = await getBuffer("testExif.jpg");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 500, height: 500},
          desiredPixelFormat: ARGB_8888
        };
        let imageInfo = await getImageInfoFromAllocator(logger, buffer, decodingOptions, image.AllocatorType.AUTO);
        expect(imageInfo.pixelFormat == ARGB_8888).assertTrue();
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_ERROR_0100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.set DecodingOptions
     *                       desiredPixelFormat: ARGB_8888
     *                 3.set AllocatorType is DMA
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_ERROR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_ERROR_0100");
      const buffer = await getBuffer("test.svg");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 350, height: 350},
        desiredPixelFormat: ARGB_8888
      };
      try {
        let imageSource = image.createImageSource(buffer);
        let pixelMap = await imageSource.createPixelMapUsingAllocator(decodingOptions, image.AllocatorType.DMA);
      } catch (error) {
        logger.log("create pixelMap error is: " + JSON.stringify(error));
        expect(error.code == UNSUPPORTED_ALLOCATOR_TYPE).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_PACKING_0100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredPixelFormat: ARGB_8888
     *                 3.set PackingOption
     *                 4.test pixelmap packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_PACKING_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_PACKING_0100");
      const buffer = await getBuffer("testExif.jpg");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 500, height: 500},
        desiredPixelFormat: ARGB_8888
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, decodingOptions);
      let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
      };
      await testPackPixelmap(done, logger, packOpts, 'packing', pixelMap, ARGB_8888);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_PACKING_0200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredPixelFormat: ARGB_8888
     *                 3.set PackingOption
     *                 4.test pixelmap packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_PACKING_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_PACKING_0200");
      if (!isSupportHEICEncode) {
        logger.log("device is not support heic encode!");
        expect(true).assertTrue();
        done();
      } else {
        const buffer = await getBuffer("test.svg");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 500, height: 500},
          desiredPixelFormat: ARGB_8888
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, decodingOptions);
        let packOpts: image.PackingOption = {
            format: "image/heic",
            quality: 98,
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            needsPackProperties: true
        };
        await testPackPixelmap(done, logger, packOpts, 'packing', pixelMap, ARGB_8888);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_PACKING_0300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredPixelFormat: ARGB_8888
     *                 3.set PackingOption
     *                 4.test pixelmap packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_PACKING_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_PACKING_0300");
      const buffer = await getBuffer("moving_test.gif");
      let DecodingOptions: image.DecodingOptions = {
        desiredSize: {width: 500, height: 500},
        desiredPixelFormat: ARGB_8888
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, DecodingOptions);
      let packOpts: image.PackingOption = {
           format: "image/gif",
          quality: 100,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
      };
      await testPackPixelmap(done, logger, packOpts, 'packing', pixelMap, RGBA_8888);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_PACKTOFILE_0100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredPixelFormat: ARGB_8888
     *                 3.set PackingOption
     *                 4.test pixelmap packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_PACKTOFILE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_PACKTOFILE_0100");
      const buffer = await getBuffer("test.webp");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 500, height: 500},
        desiredPixelFormat: ARGB_8888
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, decodingOptions);
      let packOpts: image.PackingOption = {
          format: "image/webp",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
      };
      const fdNum = await getFdCacheDir("pack_pixelmap_01.webp");
      await testPackPixelmap(done, logger, packOpts, 'packtofile', pixelMap, ARGB_8888, fdNum);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_PACKTOFILE_0200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredPixelFormat: ARGB_8888
     *                 3.set PackingOption
     *                 4.test pixelmap packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_PACKTOFILE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ALLOCATOR_PACKTOFILE_0200");
      const buffer = await getBuffer("test.png");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 500, height: 500},
        desiredPixelFormat: ARGB_8888
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, decodingOptions);
      let packOpts: image.PackingOption = {
          format: "image/png",
          quality: 100,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
      };
      const fdNum = await getFdCacheDir("pack_pixelmap_01.png");
      await testPackPixelmap(done, logger, packOpts, 'packtofile', pixelMap, RGBA_8888, fdNum);
    })
  })
}