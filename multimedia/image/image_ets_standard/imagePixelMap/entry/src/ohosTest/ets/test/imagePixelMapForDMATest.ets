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

import hilog from '@ohos.hilog';
import { describe, beforeAll, afterEach, it, expect, Level } from '@ohos/hypium';
import image from '@ohos.multimedia.image';
import fs from '@ohos.file.fs';
import common from '@ohos.app.ability.common';
import hdrCapability from '@ohos.graphics.hdrCapability';
import display from '@ohos.display';

export default function imagePixelmap() {
  let filesDir: string | undefined;
  let cacheDir: string | undefined;
  let testContext: common.UIAbilityContext;
  let isSupportHEIFDecode: boolean;
  let isSupportHdr: Boolean;
  const AUTO = image.AllocatorType.AUTO;
  const DMA = image.AllocatorType.DMA;
  const SHARE_MEMORY = image.AllocatorType.SHARE_MEMORY;
  const RGB_565 = image.PixelMapFormat.RGB_565;
  const RGBA_8888 = image.PixelMapFormat.RGBA_8888;
  const BGRA_8888 = image.PixelMapFormat.BGRA_8888;
  const RGBA_F16 = image.PixelMapFormat.RGBA_F16;
  const NV21 = image.PixelMapFormat.NV21;
  const NV12 = image.PixelMapFormat.NV12;
  const RGBA_1010102 = image.PixelMapFormat.RGBA_1010102;
  const YCBCR_P010 = image.PixelMapFormat.YCBCR_P010;
  const YCRCB_P010 = image.PixelMapFormat.YCRCB_P010;
  const RANGE_SDR = image.DecodingDynamicRange.SDR;
  const RANGE_HDR = image.DecodingDynamicRange.HDR;
  const PARAMETER_ERROR = 401;
  const UNSUPPORTED_ALLOCATOR_TYPE = 7700201;
  const DECODE_FAILED = 7700301;
  const test_DMA_HDR = "CUVAHdrMulti.jpg";
  const test_DMA_33_77 = "test_DMA_33_77.jpg";
  const test_DMA_55_77 = "test_DMA_55_77.jpg";
  const test_DMA_128_256 = "test_DMA_128_256.jpg";
  const test_DMA_512_512 = "test_DMA_512_512.jpg";
  const test_DMA_1801_4041 = "test_DMA_1801_4041.jpg";
  const test_DMA_2999_3742 = "test_DMA_2999_3742.jpg";
  const test_DMA_3072_4096 = "test_DMA_3072_4096.jpg";
  const test_DMA_3071_4095 = "test_DMA_3071_4095.jpg";

  describe('imagePixelMapForDMA', () => {
    beforeAll(async () => {
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      filesDir = AppStorage.get('pathDir')
      cacheDir = AppStorage.get('cacheDir')
      isSupportHEIFDecode =
        image.createImageSource(filesDir + '/' + "test.jpg").supportedFormats.includes("image/heic");
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

    const getImageInfo = async (logger: Logger, buffer: ArrayBuffer, decodingOptions?: image.DecodingOptions,) => {
      let imageSource = image.createImageSource(buffer);
      let pixelMap: image.PixelMap | undefined = undefined;
      if (decodingOptions != undefined) {
        pixelMap = await imageSource.createPixelMap(decodingOptions);
      } else {
        pixelMap = await imageSource.createPixelMap();
      }
      let imageInfo = await pixelMap.getImageInfo();
      await pixelMap?.release();
      await imageSource?.release();
      return imageInfo;
    }

    const getPixelmapFromAllocator = async (
      logger: Logger,
      buffer: ArrayBuffer,
      type: string,
      decodingOptions?: image.DecodingOptions,
      allocatorType?: image.AllocatorType
    ) => {
      let pixelMap: image.PixelMap | undefined = undefined;
      try {
        let imageSource = image.createImageSource(buffer);
        if (type == "sync") {
          if (decodingOptions != undefined && allocatorType == undefined) {
            pixelMap = imageSource.createPixelMapUsingAllocatorSync(decodingOptions);
          } else if (decodingOptions != undefined && allocatorType != undefined) {
            pixelMap = imageSource.createPixelMapUsingAllocatorSync(decodingOptions, allocatorType);
          } else if (decodingOptions == undefined && allocatorType == undefined) {
            pixelMap = await imageSource.createPixelMapUsingAllocatorSync();
          }
        } else {
          if (decodingOptions != undefined && allocatorType == undefined) {
            pixelMap = await imageSource.createPixelMapUsingAllocator(decodingOptions);
          } else if (decodingOptions != undefined && allocatorType != undefined) {
            pixelMap = await imageSource.createPixelMapUsingAllocator(decodingOptions, allocatorType);
          } else if (decodingOptions == undefined && allocatorType == undefined) {
            pixelMap = await imageSource.createPixelMapUsingAllocator();
          }
        }
        await imageSource?.release();
      } catch (error) {
        logger.log("getPixelmapFromAllocator error is: " + JSON.stringify(error));
      }
      if (pixelMap == undefined) {
        logger.log('Failed to create pixelMap.');
      }
      return pixelMap;
    }

    const getPixelMapFormatBytes = (pixelFormat: number) => {
      let fromatBytes = 0;
      switch (pixelFormat) {
        case RGB_565:
        case NV21:
        case NV12:
          fromatBytes = 2;
          break;
        case RGBA_8888:
        case BGRA_8888:
        case RGBA_1010102:
        case YCBCR_P010:
        case YCRCB_P010:
          fromatBytes = 4;
          break;
        case RGBA_F16:
          fromatBytes = 8;
          break;
      }
      return fromatBytes;
    }

    const checkPixelmap = async (
      done: Function,
      logger: Logger,
      pixelMap: image.PixelMap | undefined,
      originImageInfo: image.ImageInfo,
      allocatorType: image.AllocatorType = AUTO
    ): Promise<boolean> => {
      let ret = false;
      if (pixelMap != undefined) {
        let dstImageInfo = await pixelMap.getImageInfo();
        logger.log("originImageInfo is:" + JSON.stringify(originImageInfo));
        logger.log("dstImageInfo is:" + JSON.stringify(dstImageInfo));
        ret = (dstImageInfo != undefined) &&
          (dstImageInfo.size.height == originImageInfo.size.height) &&
          (dstImageInfo.size.width == originImageInfo.size.width);
        if (allocatorType != AUTO) {
          let fromatBytes = getPixelMapFormatBytes(originImageInfo.pixelFormat);
          ret = ret && (dstImageInfo.stride >= (originImageInfo.size.width * fromatBytes));
        }
      } else {
        logger.log("pixelmap is undefined");
        expect(false).assertTrue();
        done();
      }
      return ret;
    }

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, do not specify AllocatorType type
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: RGBA_8888
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0100");
      let buffer: ESObject = await getBuffer(test_DMA_HDR);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 99, height: 200 },
        desiredPixelFormat: RGBA_8888,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, do not specify AllocatorType type
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 256, height: 256},
     *                       desiredPixelFormat: BGRA_8888
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0200");
      let buffer: ESObject = await getBuffer(test_DMA_HDR);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 256, height: 256 },
        desiredPixelFormat: BGRA_8888,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, do not specify AllocatorType type
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 512, height: 512},
     *                       desiredPixelFormat: BGRA_8888
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0300");
      let buffer: ESObject = await getBuffer(test_DMA_HDR);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 512, height: 512 },
        desiredPixelFormat: BGRA_8888,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0400
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, do not specify AllocatorType type
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4001, height: 4096},
     *                       desiredPixelFormat: RGBA_8888
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0400");
      let buffer: ESObject = await getBuffer(test_DMA_HDR);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4001, height: 4096 },
        desiredPixelFormat: RGBA_8888,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0500
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, do not specify AllocatorType type
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3072, height: 4096},
     *                       desiredPixelFormat: RGBA_8888
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0500");
      let buffer: ESObject = await getBuffer(test_DMA_HDR);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3072, height: 4096 },
        desiredPixelFormat: RGBA_8888,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0600
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: RGBA_F16
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0600', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0600");
      let buffer: ESObject = await getBuffer(test_DMA_HDR);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 99, height: 200 },
        desiredPixelFormat: RGBA_F16,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, AUTO);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0700
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 256, height: 256},
     *                       desiredPixelFormat: RGBA_8888
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0700', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0700");
      let buffer: ESObject = await getBuffer(test_DMA_HDR);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 256, height: 256 },
        desiredPixelFormat: RGBA_8888,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, AUTO);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0800
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 512, height: 512},
     *                       desiredPixelFormat: NV21
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0800', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0800");
      let buffer: ESObject = await getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 512, height: 512 },
        desiredPixelFormat: NV21,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, AUTO);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0900
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4001, height: 4096},
     *                       desiredPixelFormat: NV12
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0900', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0900");
      let buffer: ESObject = await getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4001, height: 4096 },
        desiredPixelFormat: NV12,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, AUTO);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1000
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3072, height: 4096},
     *                       desiredPixelFormat: RGBA_1010102
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1000', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1000");
      let buffer: ESObject = await getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3072, height: 4096 },
        desiredPixelFormat: RGBA_1010102,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, AUTO);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: RGB_565
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1100");
      let buffer: ESObject = await getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 99, height: 200 },
        desiredPixelFormat: RGB_565,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, SHARE_MEMORY);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 256, height: 256},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1200");
      let buffer: ESObject = await getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 256, height: 256 },
        desiredPixelFormat: YCRCB_P010,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, SHARE_MEMORY);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1300");
      let buffer: ESObject = await getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3071, height: 4096 },
        desiredPixelFormat: YCRCB_P010,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, SHARE_MEMORY);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1301
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3072, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1301', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1301");
      let buffer: ESObject = await getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3072, height: 4096 },
        desiredPixelFormat: YCRCB_P010,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, SHARE_MEMORY);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1400
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1400");
      let buffer: ESObject = await getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3071, height: 4096 },
        desiredPixelFormat: YCRCB_P010,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1500
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3072, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1500");
      let buffer: ESObject = await getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3072, height: 4096 },
        desiredPixelFormat: YCRCB_P010,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1600
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1600', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1600");
      let buffer: ESObject = await getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 99, height: 200 },
        desiredPixelFormat: YCRCB_P010,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1601
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 256, height: 256},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1601', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1601");
      let buffer: ESObject = await getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 256, height: 256 },
        desiredPixelFormat: YCRCB_P010,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1700
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.do not specify  DecodingOptions and AllocatorType type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1700', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1700");
      let buffer: ESObject = await getBuffer(test_DMA_33_77);
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default");
      let imageInfo = await getImageInfo(logger, buffer);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1800
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.do not specify  DecodingOptions and AllocatorType type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1800', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1800");
      let buffer: ESObject = await getBuffer(test_DMA_128_256);
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default");
      let imageInfo = await getImageInfo(logger, buffer);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1900
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.do not specify  DecodingOptions and AllocatorType type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1900', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1900");
      let buffer: ESObject = await getBuffer(test_DMA_512_512);
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default");
      let imageInfo = await getImageInfo(logger, buffer);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2000
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.do not specify  DecodingOptions and AllocatorType type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2000', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2000");
      let buffer: ESObject = await getBuffer(test_DMA_2999_3742);
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default");
      let imageInfo = await getImageInfo(logger, buffer);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.do not specify  DecodingOptions and AllocatorType type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2100");
      let buffer: ESObject = await getBuffer(test_DMA_3072_4096);
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default");
      let imageInfo = await getImageInfo(logger, buffer);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, do not specify AllocatorType type
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: RGBA_8888
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2200");
      let buffer: ESObject = await getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 99, height: 200 },
        desiredPixelFormat: RGBA_8888,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, do not specify AllocatorType type
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 256, height: 256},
     *                       desiredPixelFormat: BGRA_8888
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2300");
      let buffer: ESObject = await getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 256, height: 256 },
        desiredPixelFormat: BGRA_8888,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2400
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, do not specify AllocatorType type
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 512, height: 512},
     *                       desiredPixelFormat: BGRA_8888
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2400");
      let buffer: ESObject = await getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 512, height: 512 },
        desiredPixelFormat: BGRA_8888,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2500
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, do not specify AllocatorType type
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4001, height: 4096},
     *                       desiredPixelFormat: RGBA_8888
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2500");
      let buffer: ESObject = await getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4001, height: 4096 },
        desiredPixelFormat: RGBA_8888,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2600
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, do not specify AllocatorType type
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3072, height: 4096},
     *                       desiredPixelFormat: RGBA_8888
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2600', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2600");
      let buffer: ESObject = await getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3072, height: 4096 },
        desiredPixelFormat: RGBA_8888,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2700
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: RGBA_F16
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2700', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2700");
      let buffer: ESObject = await getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 99, height: 200 },
        desiredPixelFormat: RGBA_F16,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, AUTO);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2800
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 256, height: 256},
     *                       desiredPixelFormat: RGBA_8888
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2800', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2800");
      let buffer: ESObject = await getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 256, height: 256 },
        desiredPixelFormat: RGBA_8888,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, AUTO);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2900
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 512, height: 512},
     *                       desiredPixelFormat: NV21
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2900', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2900");
      let buffer: ESObject = await getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 512, height: 512 },
        desiredPixelFormat: NV21,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, AUTO);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3000
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4000, height: 4096},
     *                       desiredPixelFormat: NV12
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3000', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3000");
      let buffer: ESObject = await getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4000, height: 4096 },
        desiredPixelFormat: NV12,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, AUTO);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3072, height: 4096},
     *                       desiredPixelFormat: RGBA_1010102
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3100");
      let buffer: ESObject = await getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3072, height: 4096 },
        desiredPixelFormat: RGBA_1010102,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, AUTO);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3200");
      let buffer: ESObject = await getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 99, height: 200 },
        desiredPixelFormat: YCRCB_P010,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, SHARE_MEMORY);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 256, height: 256},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3300");
      let buffer: ESObject = await getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 256, height: 256 },
        desiredPixelFormat: YCRCB_P010,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, SHARE_MEMORY);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3400
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3400");
      let buffer: ESObject = await getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3071, height: 4096 },
        desiredPixelFormat: YCRCB_P010,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, SHARE_MEMORY);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3401
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3401', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3401");
      let buffer: ESObject = await getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3071, height: 4096 },
        desiredPixelFormat: YCRCB_P010,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, SHARE_MEMORY);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3500
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: NV12
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3500");
      let buffer: ESObject = await getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3071, height: 4096 },
        desiredPixelFormat: YCRCB_P010,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3600
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3072, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3600', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3600");
      let buffer: ESObject = await getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3072, height: 4096 },
        desiredPixelFormat: YCRCB_P010,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3700
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3700', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3700");
      let buffer: ESObject = await getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 99, height: 200 },
        desiredPixelFormat: YCRCB_P010,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3701
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 256, height: 256},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3701', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3701");
      let buffer: ESObject = await getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 256, height: 256 },
        desiredPixelFormat: YCRCB_P010,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3800
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.do not specify  DecodingOptions and AllocatorType type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3800', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3800");
      let buffer: ESObject = await getBuffer(test_DMA_33_77);
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync");
      let imageInfo = await getImageInfo(logger, buffer);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3900
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.do not specify  DecodingOptions and AllocatorType type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3900', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3900");
      let buffer: ESObject = await getBuffer(test_DMA_128_256);
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync");
      let imageInfo = await getImageInfo(logger, buffer);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4000
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.do not specify  DecodingOptions and AllocatorType type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4000', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4000");
      let buffer: ESObject = await getBuffer(test_DMA_512_512);
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync");
      let imageInfo = await getImageInfo(logger, buffer);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.do not specify  DecodingOptions and AllocatorType type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4100");
      let buffer: ESObject = await getBuffer(test_DMA_2999_3742);
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync");
      let imageInfo = await getImageInfo(logger, buffer);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.do not specify DecodingOptions and AllocatorType type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4200");
      let buffer: ESObject = await getBuffer(test_DMA_3072_4096);
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync");
      let imageInfo = await getImageInfo(logger, buffer);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, do not specify AllocatorType
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010,
     *                       desiredDynamicRange: RANGE_HDR
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let buffer: ESObject = await getBuffer(test_DMA_3071_4095);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 99, height: 200 },
          desiredPixelFormat: YCRCB_P010,
          desiredDynamicRange: RANGE_HDR
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions);
        let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
        let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4400
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, do not specify AllocatorType
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4001, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010,
     *                       desiredDynamicRange: RANGE_HDR
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let buffer: ESObject = await getBuffer(test_DMA_3071_4095);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4001, height: 4096 },
          desiredPixelFormat: YCRCB_P010,
          desiredDynamicRange: RANGE_HDR
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions);
        let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
        let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4500
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010,
     *                       desiredDynamicRange: RANGE_HDR
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let buffer: ESObject = await getBuffer(test_DMA_3071_4095);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 99, height: 200 },
          desiredPixelFormat: YCRCB_P010,
          desiredDynamicRange: RANGE_HDR
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, AUTO);
        let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
        let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4600
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4001, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010,
     *                       desiredDynamicRange: RANGE_HDR
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4600', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4600");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let buffer: ESObject = await getBuffer(test_DMA_3071_4095);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4001, height: 4096 },
          desiredPixelFormat: YCRCB_P010,
          desiredDynamicRange: RANGE_HDR
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, AUTO);
        let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
        let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4700
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010,
     *                       desiredDynamicRange: RANGE_HDR
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4700', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4700");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let buffer: ESObject = await getBuffer(test_DMA_3071_4095);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 99, height: 200 },
          desiredPixelFormat: YCRCB_P010,
          desiredDynamicRange: RANGE_HDR
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
        let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
        let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4800
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010,
     *                       desiredDynamicRange: RANGE_HDR
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4800', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4800");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let buffer: ESObject = await getBuffer(test_DMA_3071_4095);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 3071, height: 4096 },
          desiredPixelFormat: YCRCB_P010,
          desiredDynamicRange: RANGE_HDR
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
        let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
        let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4900
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.do not specify  DecodingOptions and AllocatorType type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4900', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4900");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let buffer: ESObject = await getBuffer(test_DMA_55_77);
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default");
        let imageInfo = await getImageInfo(logger, buffer);
        let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4901
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.do not specify  DecodingOptions and AllocatorType type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4901', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4901");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let buffer: ESObject = await getBuffer(test_DMA_3071_4095);
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default");
        let imageInfo = await getImageInfo(logger, buffer);
        let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5000
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, do not specify AllocatorType
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010,
     *                       desiredDynamicRange: RANGE_HDR
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5000', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5000");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let buffer: ESObject = await getBuffer(test_DMA_3071_4095);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 99, height: 200 },
          desiredPixelFormat: YCRCB_P010,
          desiredDynamicRange: RANGE_HDR
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions);
        let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
        let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, do not specify AllocatorType
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4001, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010,
     *                       desiredDynamicRange: RANGE_HDR
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let buffer: ESObject = await getBuffer(test_DMA_3071_4095);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4001, height: 4096 },
          desiredPixelFormat: YCRCB_P010,
          desiredDynamicRange: RANGE_HDR
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions);
        let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
        let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010,
     *                       desiredDynamicRange: RANGE_HDR
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let buffer: ESObject = await getBuffer(test_DMA_3071_4095);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 99, height: 200 },
          desiredPixelFormat: YCRCB_P010,
          desiredDynamicRange: RANGE_HDR
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, AUTO);
        let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
        let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4001, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010,
     *                       desiredDynamicRange: RANGE_HDR
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let buffer: ESObject = await getBuffer(test_DMA_3071_4095);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4001, height: 4096 },
          desiredPixelFormat: YCRCB_P010,
          desiredDynamicRange: RANGE_HDR
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, AUTO);
        let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
        let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5400
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010,
     *                       desiredDynamicRange: RANGE_HDR
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let buffer: ESObject = await getBuffer(test_DMA_3071_4095);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 99, height: 200 },
          desiredPixelFormat: YCRCB_P010,
          desiredDynamicRange: RANGE_HDR
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
        let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
        let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5500
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010,
     *                       desiredDynamicRange: RANGE_HDR
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let buffer: ESObject = await getBuffer(test_DMA_3071_4095);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 3071, height: 4096 },
          desiredPixelFormat: YCRCB_P010,
          desiredDynamicRange: RANGE_HDR
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
        let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
        let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5600
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.do not specify  DecodingOptions and AllocatorType type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5600', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5600");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let buffer: ESObject = await getBuffer(test_DMA_55_77);
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync");
        let imageInfo = await getImageInfo(logger, buffer);
        let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5700
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     *                 2.do not specify  DecodingOptions and AllocatorType type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5700', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5700");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let buffer: ESObject = await getBuffer(test_DMA_3071_4095);
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync");
        let imageInfo = await getImageInfo(logger, buffer);
        let ret = await checkPixelmap(done, logger, pixelMap, imageInfo);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_0100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_0100");
      let buffer: ESObject = await getBuffer("test.png");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 99, height: 200 },
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, SHARE_MEMORY);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_0200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_0200");
      let buffer: ESObject = await getBuffer("test.png");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3071, height: 4096 },
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_0300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_0300");
      let buffer: ESObject = await getBuffer("test.png");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3071, height: 4096 },
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, AUTO);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_0100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_0100");
      let buffer: ESObject = await getBuffer("test.bmp");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 99, height: 200 },
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, SHARE_MEMORY);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_0200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_0200");
      let buffer: ESObject = await getBuffer("test.bmp");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3071, height: 4096 },
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_0300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_0300");
      let buffer: ESObject = await getBuffer("test.bmp");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3071, height: 4096 },
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, AUTO);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_0100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_0100");
      let buffer: ESObject = await getBuffer("test.gif");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 99, height: 200 },
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, SHARE_MEMORY);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_0200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_0200");
      let buffer: ESObject = await getBuffer("test.gif");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3071, height: 4096 },
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_0300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_0300");
      let buffer: ESObject = await getBuffer("test.gif");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3071, height: 4096 },
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, AUTO);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_0100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_0100");
      let buffer: ESObject = await getBuffer("test.webp");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 99, height: 200 },
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, SHARE_MEMORY);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_0200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_0200");
      let buffer: ESObject = await getBuffer("test.webp");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3071, height: 4096 },
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_0200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_0200");
      let buffer: ESObject = await getBuffer("test.webp");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3071, height: 4096 },
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, AUTO);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_0100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let buffer: ESObject = await getBuffer("test_dng.dng");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 99, height: 200 },
          desiredPixelFormat: YCRCB_P010
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, SHARE_MEMORY);
        let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
        let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_0200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let buffer: ESObject = await getBuffer("test_dng.dng");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 3071, height: 4096 },
          desiredPixelFormat: YCRCB_P010
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
        let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
        let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_0300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let buffer: ESObject = await getBuffer("test_dng.dng");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 3071, height: 4096 },
          desiredPixelFormat: YCRCB_P010
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, AUTO);
        let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
        let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_0100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_0100");
      let buffer: ESObject = await getBuffer("test.ico");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 99, height: 200 },
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, SHARE_MEMORY);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_0200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_0200");
      let buffer: ESObject = await getBuffer("test.ico");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3071, height: 4096 },
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_0300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_0300");
      let buffer: ESObject = await getBuffer("test.ico");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3071, height: 4096 },
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, AUTO);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_0100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
      } else {
        let buffer: ESObject = await getBuffer("0801_sdr2.heic");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 99, height: 200 },
          desiredPixelFormat: YCRCB_P010
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, SHARE_MEMORY);
        let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
        let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_0200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
      } else {
        let buffer: ESObject = await getBuffer("0801_sdr2.heic");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 3071, height: 4096 },
          desiredPixelFormat: YCRCB_P010
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
        let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
        let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_0300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
      } else {
        let buffer: ESObject = await getBuffer("0801_sdr2.heic");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 3071, height: 4096 },
          desiredPixelFormat: YCRCB_P010
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, AUTO);
        let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
        let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_SYNC_0100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_SYNC_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_SYNC_0100");
      let buffer: ESObject = await getBuffer("test.png");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 99, height: 200 },
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, SHARE_MEMORY);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_SYNC_0200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_SYNC_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_SYNC_0200");
      let buffer: ESObject = await getBuffer("test.png");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3071, height: 4096 },
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_SYNC_0300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_SYNC_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_SYNC_0300");
      let buffer: ESObject = await getBuffer("test.png");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3071, height: 4096 },
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, AUTO);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_SYNC_0100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_SYNC_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_SYNC_0100");
      let buffer: ESObject = await getBuffer("test.bmp");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 99, height: 200 },
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, SHARE_MEMORY);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_SYNC_0200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_SYNC_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_SYNC_0200");
      let buffer: ESObject = await getBuffer("test.bmp");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3071, height: 4096 },
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_SYNC_0300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_SYNC_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_SYNC_0300");
      let buffer: ESObject = await getBuffer("test.bmp");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3071, height: 4096 },
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, AUTO);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_SYNC_0100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_SYNC_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_SYNC_0100");
      let buffer: ESObject = await getBuffer("test.gif");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 99, height: 200 },
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, SHARE_MEMORY);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_SYNC_0200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_SYNC_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_SYNC_0200");
      let buffer: ESObject = await getBuffer("test.gif");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3071, height: 4096 },
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_SYNC_0300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_SYNC_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_SYNC_0300");
      let buffer: ESObject = await getBuffer("test.gif");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3071, height: 4096 },
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, AUTO);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_SYNC_0100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_SYNC_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_SYNC_0100");
      let buffer: ESObject = await getBuffer("test.webp");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 99, height: 200 },
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, SHARE_MEMORY);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_SYNC_0200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_SYNC_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_SYNC_0200");
      let buffer: ESObject = await getBuffer("test.webp");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3071, height: 4096 },
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_SYNC_0300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_SYNC_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_SYNC_0300");
      let buffer: ESObject = await getBuffer("test.webp");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3071, height: 4096 },
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, AUTO);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_SYNC_0100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_SYNC_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_SYNC_0100");
      let buffer: ESObject = await getBuffer("test.ico");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 99, height: 200 },
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, SHARE_MEMORY);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_SYNC_0200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_SYNC_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_SYNC_0200");
      let buffer: ESObject = await getBuffer("test.ico");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3071, height: 4096 },
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_SYNC_0300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_SYNC_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_SYNC_0300");
      let buffer: ESObject = await getBuffer("test.ico");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3071, height: 4096 },
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, AUTO);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_SYNC_0100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_SYNC_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_SYNC_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let buffer: ESObject = await getBuffer("test_dng.dng");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 99, height: 200 },
          desiredPixelFormat: YCRCB_P010
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, SHARE_MEMORY);
        let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
        let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_SYNC_0200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_SYNC_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_SYNC_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let buffer: ESObject = await getBuffer("test_dng.dng");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 3071, height: 4096 },
          desiredPixelFormat: YCRCB_P010
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
        let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
        let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_SYNC_0300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_SYNC_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_SYNC_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let buffer: ESObject = await getBuffer("test_dng.dng");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 3071, height: 4096 },
          desiredPixelFormat: YCRCB_P010
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, AUTO);
        let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
        let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_SYNC_0100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_SYNC_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_SYNC_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
      } else {
        let buffer: ESObject = await getBuffer("0801_sdr2.heic");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 99, height: 200 },
          desiredPixelFormat: YCRCB_P010
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, SHARE_MEMORY);
        let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
        let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_SYNC_0200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_SYNC_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_SYNC_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
      } else {
        let buffer: ESObject = await getBuffer("0801_sdr2.heic");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 3071, height: 4096 },
          desiredPixelFormat: YCRCB_P010
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
        let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
        let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_SYNC_0300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_SYNC_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_SYNC_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
      } else {
        let buffer: ESObject = await getBuffer("0801_sdr2.heic");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 3071, height: 4096 },
          desiredPixelFormat: YCRCB_P010
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, AUTO);
        let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
        let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, do not specify AllocatorType type
     *                 2.set DecodingOptions is null
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0100");
      try {
        let buffer: ESObject = await getBuffer("test_DMA.jpg");
        let imageSource = image.createImageSource(buffer);
        let pixelMap = await imageSource.createPixelMapUsingAllocator(null);
        if (pixelMap != undefined) {
          logger.log("pixelmap is not undefined");
          expect(false).assertTrue();
          await pixelMap?.release();
          buffer = undefined;
          await imageSource?.release();
          done();
        }
      } catch (error) {
        logger.log("createPixelMapUsingAllocatorSync is error: " + JSON.stringify(error));
        expect(error.code == PARAMETER_ERROR).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions is null
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0200");
      try {
        let buffer: ESObject = await getBuffer("test_DMA.jpg");
        let imageSource = image.createImageSource(buffer);
        let pixelMap = await imageSource.createPixelMapUsingAllocator(null, SHARE_MEMORY);
        if (pixelMap != undefined) {
          logger.log("pixelmap is not undefined");
          expect(false).assertTrue();
          await pixelMap?.release();
          buffer = undefined;
          await imageSource?.release();
          done();
        }
      } catch (error) {
        logger.log("createPixelMapUsingAllocatorSync is error: " + JSON.stringify(error));
        expect(error.code == PARAMETER_ERROR).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions is null
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0300");
      try {
        let buffer: ESObject = await getBuffer("test_DMA.jpg");
        let imageSource = image.createImageSource(buffer);
        let pixelMap = await imageSource.createPixelMapUsingAllocator(null, null);
        if (pixelMap != undefined) {
          logger.log("pixelmap is not undefined");
          expect(false).assertTrue();
          await pixelMap?.release();
          buffer = undefined;
          await imageSource?.release();
          done();
        }
      } catch (error) {
        logger.log("createPixelMapUsingAllocatorSync is error: " + JSON.stringify(error));
        expect(error.code == PARAMETER_ERROR).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0400
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, do not specify AllocatorType type
     *                 2.set DecodingOptions is null
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0400");
      try {
        let buffer: ESObject = await getBuffer("test_DMA.jpg");
        let imageSource = image.createImageSource(buffer);
        let pixelMap = imageSource.createPixelMapUsingAllocatorSync(null);
        if (pixelMap != undefined) {
          logger.log("pixelmap is not undefined");
          expect(false).assertTrue();
          await pixelMap?.release();
          buffer = undefined;
          await imageSource?.release();
          done();
        }
      } catch (error) {
        logger.log("createPixelMapUsingAllocatorSync is error: " + JSON.stringify(error));
        expect(error.code == PARAMETER_ERROR).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0500
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions is null
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0500");
      try {
        let buffer: ESObject = await getBuffer("test_DMA.jpg");
        let imageSource = image.createImageSource(buffer);
        let pixelMap = imageSource.createPixelMapUsingAllocatorSync(null, SHARE_MEMORY);
        if (pixelMap != undefined) {
          logger.log("pixelmap is not undefined");
          expect(false).assertTrue();
          await pixelMap?.release();
          buffer = undefined;
          await imageSource?.release();
          done();
        }
      } catch (error) {
        logger.log("createPixelMapUsingAllocatorSync is error: " + JSON.stringify(error));
        expect(error.code == PARAMETER_ERROR).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0600
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions is null
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0600', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0600");
      try {
        let buffer: ESObject = await getBuffer("test_DMA.jpg");
        let imageSource = image.createImageSource(buffer);
        let pixelMap = imageSource.createPixelMapUsingAllocatorSync(null, null);
        if (pixelMap != undefined) {
          logger.log("pixelmap is not undefined");
          expect(false).assertTrue();
          await pixelMap?.release();
          buffer = undefined;
          await imageSource?.release();
          done();
        }
      } catch (error) {
        logger.log("createPixelMapUsingAllocatorSync is error: " + JSON.stringify(error));
        expect(error.code == PARAMETER_ERROR).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0700
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010,
     *                       desiredDynamicRange: RANGE_HDR
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0700', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0700");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        try {
          let buffer: ESObject = await getBuffer(test_DMA_3071_4095); ``
          let decodingOptions: image.DecodingOptions = {
            desiredSize: { width: 99, height: 200 },
            desiredPixelFormat: YCRCB_P010,
            desiredDynamicRange: RANGE_HDR
          };
          let imageSource = image.createImageSource(buffer);
          let pixelMap = await imageSource.createPixelMapUsingAllocator(decodingOptions, SHARE_MEMORY);
          if (pixelMap != undefined) {
            logger.log("pixelmap is not undefined");
            expect(false).assertTrue();
            await pixelMap?.release();
            buffer = undefined;
            await imageSource?.release();
            done();
          }
        } catch (error) {
          logger.log("createPixelMapUsingAllocator is error: " + JSON.stringify(error));
          expect(error.code == UNSUPPORTED_ALLOCATOR_TYPE).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0800
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010,
     *                       desiredDynamicRange: RANGE_HDR
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0800', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0800");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        try {
          let buffer: ESObject = await getBuffer(test_DMA_3071_4095);
          let decodingOptions: image.DecodingOptions = {
            desiredSize: { width: 3071, height: 4096 },
            desiredPixelFormat: YCRCB_P010,
            desiredDynamicRange: RANGE_HDR
          };
          let imageSource = image.createImageSource(buffer);
          let pixelMap = imageSource.createPixelMapUsingAllocatorSync(decodingOptions, SHARE_MEMORY);
          if (pixelMap != undefined) {
            logger.log("pixelmap is not undefined");
            expect(false).assertTrue();
            await pixelMap?.release();
            await imageSource?.release();
            buffer = undefined;
            done();
          }
        } catch (error) {
          logger.log("createPixelMapUsingAllocator is error: " + JSON.stringify(error));
          expect(error.code == UNSUPPORTED_ALLOCATOR_TYPE).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0900
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0900', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0900");
      try {
        let buffer: ESObject = await getBuffer("SIZE_0_0.jpg");
        let imageSource = image.createImageSource(buffer);
        let pixelMap = await imageSource.createPixelMapUsingAllocator();
        if (pixelMap != undefined) {
          logger.log("pixelmap is not undefined");
          expect(false).assertTrue();
          await pixelMap?.release();
          buffer = undefined;
          await imageSource?.release();
          done();
        }
      } catch (error) {
        logger.log("createPixelMapUsingAllocator is error: " + JSON.stringify(error));
        expect(error.code == DECODE_FAILED).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_1000
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_1000', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_1000");
      try {
        let buffer: ESObject = await getBuffer("SIZE_0_0.jpg");
        let imageSource = image.createImageSource(buffer);
        let pixelMap = await imageSource.createPixelMapUsingAllocatorSync();
        if (pixelMap != undefined) {
          logger.log("pixelmap is not undefined");
          expect(false).assertTrue();
          await pixelMap?.release();
          buffer = undefined;
          await imageSource?.release();
          done();
        }
      } catch (error) {
        logger.log("createPixelMapUsingAllocatorSync is error: " + JSON.stringify(error));
        expect(error.code == DECODE_FAILED).assertTrue();
        done();
      }
    })
  })
}