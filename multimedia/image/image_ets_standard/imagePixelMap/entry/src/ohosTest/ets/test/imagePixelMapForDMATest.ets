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
import taskpool from '@ohos.taskpool';

class Logger {
  testNum: string;

  constructor(testNum: string) {
    this.testNum = testNum;
  }

  log(msg: string) {
    hilog.info(0x0000, "imagePixelMapForDMA", 'case: %{public}s msg:%{public}s', this.testNum, msg);
  }
}

interface exceptDecodeOptions {
  expectedWidth: number;
  expectedHeight: number;
  expectedPixelFormat: image.PixelMapFormat;
}

async function createPixelMapSyncDmaInTaskPool(
  logger: Logger,
  filePath: string,
  decodingOptions: image.DecodingOptions,
  allocatorType: image.AllocatorType,
  expectedDecodeOpts: exceptDecodeOptions
): Promise<boolean> {
  logger.log("taskpool start");
  try {
    let task = new taskpool.Task(pixelTest, filePath, decodingOptions, allocatorType, expectedDecodeOpts);
    let ret = (await taskpool.execute(task)) as boolean;
    logger.log("taskpool ret: " + ret);
    return ret;
  } catch (error) {
    logger.log('taskpool: taskpool execute error is ' + error);
    return false;
  }
}

@Concurrent
async function pixelTest(
  filePath: string,
  decodingOptions: image.DecodingOptions,
  allocatorType: image.AllocatorType,
  expectedDecodeOpts: exceptDecodeOptions
): Promise<boolean> {
  console.info("asynchronous blocking start!");
  // 模拟异步操作
  return await new Promise<boolean>((resolve) => {
    setTimeout(() => {
      console.log('asynchronous blocking: filePath: ' + filePath);
      console.log('asynchronous blocking: decodingOptions: ' + JSON.stringify(decodingOptions));
      console.log('asynchronous blocking: allocatorType: ' + allocatorType);
      console.log('asynchronous blocking: expectedDecodeOpts: ' + JSON.stringify(expectedDecodeOpts));

      const src = image.createImageSource(filePath);
      console.log("asynchronous blocking: createImageSource end!");
      let pm: image.PixelMap = src.createPixelMapUsingAllocatorSync(decodingOptions, allocatorType);
      console.log("asynchronous blocking: createPixelMapSync end!");
      const imageInfo = pm.getImageInfoSync();
      console.log("asynchronous blocking: getImageInfoSync end, Info is:" + JSON.stringify(imageInfo));
      let ret = (imageInfo.size.width == expectedDecodeOpts.expectedWidth) &&
                (imageInfo.size.height == expectedDecodeOpts.expectedHeight) &&
                (imageInfo.pixelFormat == expectedDecodeOpts.expectedPixelFormat);
      console.log("asynchronous blocking: ret is: " + ret);
      pm.release();
      src.release();
      console.log('asynchronous blocking end!');
      resolve(ret);
    }, 15000);
  });
}

export default function imagePixelmap() {
  let filesDir: string | undefined;
  let cacheDir: string | undefined;
  let testContext: common.UIAbilityContext;
  let isSupportHEIFDecode: boolean;
  let isSupportHdr: Boolean;
  let isSupportTiff: Boolean;
  const AUTO = image.AllocatorType.AUTO;
  const DMA = image.AllocatorType.DMA;
  const SHARE_MEMORY = image.AllocatorType.SHARE_MEMORY;
  const RGB_565 = image.PixelMapFormat.RGB_565;
  const RGBA_8888 = image.PixelMapFormat.RGBA_8888;
  const BGRA_8888 = image.PixelMapFormat.BGRA_8888;
  const RGBA_F16 = image.PixelMapFormat.RGBA_F16;
  const RGB_888 = image.PixelMapFormat.RGB_888;
  const NV21 = image.PixelMapFormat.NV21;
  const NV12 = image.PixelMapFormat.NV12;
  const RGBA_1010102 = image.PixelMapFormat.RGBA_1010102;
  const YCBCR_P010 = image.PixelMapFormat.YCBCR_P010;
  const YCRCB_P010 = image.PixelMapFormat.YCRCB_P010;
  const RANGE_SDR = image.DecodingDynamicRange.SDR;
  const RANGE_HDR = image.DecodingDynamicRange.HDR;
  const CROP_FIRST = image.CropAndScaleStrategy.CROP_FIRST;
  const SCALE_FIRST = image.CropAndScaleStrategy.SCALE_FIRST;
  const PARAMETER_ERROR = 401;
  const UNSUPPORTED_ALLOCATOR_TYPE = 7700201;
  const DECODE_FAILED = 7700301;
  const IMAGE_TOO_LARGE = 7700103;
  const FAILED_TO_ALLOCATE_MEMORY = 7700302;
  const test_DMA_HDR = "CUVAHdrMulti.jpg";
  const test_DMA_33_77 = "test_DMA_33_77.jpg";
  const test_DMA_55_77 = "test_DMA_55_77.jpg";
  const test_DMA_128_256 = "test_DMA_128_256.jpg";
  const test_DMA_512_512 = "test_DMA_512_512.jpg";
  const test_DMA_1801_4041 = "test_DMA_1801_4041.jpg";
  const test_DMA_2999_3742 = "test_DMA_2999_3742.jpg";
  const test_DMA_3072_4096 = "test_DMA_3072_4096.jpg";
  const test_DMA_3071_4095 = "test_DMA_3071_4095.jpg";
  const TEST_DECODE_LARGE_IMAGE_JPEG = "big-30118x30118.jpg";
  const TEST_DECODE_LARGE_IMAGE_HEIC = "big-30000x30000.heic";
  const TEST_DECODE_LARGE_IMAGE_PNG  = "30009x30009_without_alpha.png";
  const test_wbmp = 'test.wbmp';

  describe('imagePixelMapForDMA', () => {
    beforeAll(async () => {
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      filesDir = AppStorage.get('pathDir')
      cacheDir = AppStorage.get('cacheDir')
      isSupportHEIFDecode =
        image.createImageSource(filesDir + '/' + "test.jpg").supportedFormats.includes("image/heic");
      isSupportTiff =
        image.getImageSourceSupportedFormats().includes("image/tiff");
      isSupportHdr =
        !display.getDefaultDisplaySync().hdrFormats.includes(hdrCapability.HDRFormat.NONE) &&
        display.getDefaultDisplaySync().hdrFormats.length != 0;
    })

    afterEach(async () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'afterEach case');
    });

    const getFilePath = (fileName: string): string => {
      const filePath = filesDir + '/' + fileName;
      return filePath;
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
      allocatorType: image.AllocatorType = AUTO,
      exceptedMimeType?: string
    ): Promise<boolean> => {
      let ret = false;
      if (pixelMap != undefined) {
        let dstImageInfo = await pixelMap.getImageInfo();
        logger.log("originImageInfo is:" + JSON.stringify(originImageInfo));
        logger.log("dstImageInfo is:" + JSON.stringify(dstImageInfo));
        ret = (dstImageInfo != undefined) &&
              (dstImageInfo.size.height == originImageInfo.size.height) &&
              (dstImageInfo.size.width  == originImageInfo.size.width) &&
              (dstImageInfo.mimeType == exceptedMimeType || exceptedMimeType == undefined);
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

     const testDecodeTiff = async (
      logger: Logger,
      isSync: boolean,
      fileName: string,
      decodeOption: image.DecodingOptions,
      exceptedMimeType: string,
      allocatorType: image.AllocatorType
    ): Promise<boolean> => {
      try {
        let filePath = getFilePath(fileName);
        let imageSource = image.createImageSource(filePath);
        let pixelMap: image.PixelMap;
        if (isSync) {
          pixelMap = imageSource.createPixelMapUsingAllocatorSync(decodeOption, allocatorType);
        } else {
          pixelMap = await imageSource.createPixelMapUsingAllocator(decodeOption, allocatorType);
        }

        logger.log("createPixelMap end!");
        let imageInfo = await pixelMap.getImageInfo();
        logger.log("getImageInfoSync end, InfoSync is:" + JSON.stringify(imageInfo));

        let expectedWidth = decodeOption.desiredSize?.width;
        let expectedHeight = decodeOption.desiredSize?.height;
        let expectedPixelFormat = decodeOption.desiredPixelFormat;
        if (decodeOption.cropAndScaleStrategy == SCALE_FIRST && decodeOption.desiredRegion) {
          expectedWidth = decodeOption.desiredRegion.size.width;
          expectedHeight = decodeOption.desiredRegion.size.height;
          expectedPixelFormat = RGBA_8888; // SCALE_FIRST模式下，像素格式为RGBA_8888
        }

        let ret = (expectedWidth == imageInfo!.size.width) &&
                  (expectedHeight == imageInfo!.size.height) &&
                  (expectedPixelFormat  == imageInfo!.pixelFormat) &&
                  (exceptedMimeType == imageInfo!.mimeType);
        logger.log("expectedWidth is: " + expectedWidth + ", imageInfo.width is: " + imageInfo!.size.width);
        logger.log("expectedHeight is: " + expectedHeight + ", imageInfo.height is: " + imageInfo!.size.height);
        logger.log("desiredPixelFormat is: " + expectedPixelFormat + ", imageInfo.pixelFormat is: " + imageInfo!.pixelFormat);
        logger.log("exceptedMimeType is: " + exceptedMimeType + ", imageInfo.mimeType is: " + imageInfo!.mimeType);
        logger.log("testDecodeTiff ret is: " + ret);
        return ret;
      } catch (error) {
        logger.log("testDecodeTiff error is: " + JSON.stringify(error));
        return false;
      }
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0100
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0200
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0300
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0400
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0500
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0600
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0700
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0800
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_0900
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1000
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1301
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1301
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1400
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1500
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1500
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1600
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1600
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1601
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1601
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1700
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1700
     * @tc.desc   1.create pixelmap object by imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1800
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1800
     * @tc.desc   1.create pixelmap object by imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1900
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_1900
     * @tc.desc   1.create pixelmap object by imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2000
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2000
     * @tc.desc   1.create pixelmap object by imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2100
     * @tc.desc   1.create pixelmap object by imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2200
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2300
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2400
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2500
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2500
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2600
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2600
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2700
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2700
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2800
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2800
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2900
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_2900
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3000
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3000
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3400
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3401
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3401
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3500
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3500
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3600
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3600
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3700
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3700
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3701
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3701
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3800
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3800
     * @tc.desc   1.create pixelmap object by imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3900
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_3900
     * @tc.desc   1.create pixelmap object by imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4000
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4000
     * @tc.desc   1.create pixelmap object by imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4100
     * @tc.desc   1.create pixelmap object by imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4200
     * @tc.desc   1.create pixelmap object by imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4300
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4400
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4500
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4500
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4600
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4600
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4700
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4700
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4800
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4800
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4900
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4900
     * @tc.desc   1.create pixelmap object by imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4901
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_4901
     * @tc.desc   1.create pixelmap object by imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5000
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5000
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5100
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5400
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5500
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5500
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5600
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5600
     * @tc.desc   1.create pixelmap object by imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5700
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_5700
     * @tc.desc   1.create pixelmap object by imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_0300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_0300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_0300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_0300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_0300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_0300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_SYNC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_SYNC_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_SYNC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_SYNC_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_SYNC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_SYNC_0300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_SYNC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_SYNC_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_SYNC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_SYNC_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_SYNC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_SYNC_0300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_SYNC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_SYNC_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_SYNC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_SYNC_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_SYNC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_SYNC_0300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_SYNC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_SYNC_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_SYNC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_SYNC_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_SYNC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_SYNC_0300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_SYNC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_SYNC_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_SYNC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_SYNC_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_SYNC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_SYNC_0300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_SYNC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_SYNC_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_SYNC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_SYNC_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_SYNC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_SYNC_0300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_SYNC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_SYNC_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_SYNC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_SYNC_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_SYNC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_SYNC_0300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0100
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0400
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0500
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0600
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0700
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0800
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_0900
     * @tc.desc   1.create pixelmap object by imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_1000
     * @tc.desc   1.create pixelmap object by imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredRegion: { size: { width: 1124, height: 1400 }, x: 0, y: 0 },
        desiredPixelFormat: RGBA_8888,
        cropAndScaleStrategy: CROP_FIRST
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredRegion: { size: { width: 1124, height: 1400 }, x: 0, y: 0 },
        desiredPixelFormat: RGB_565,
        cropAndScaleStrategy: SCALE_FIRST
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1124) && (imageInfo.size.height == 1400) && (imageInfo.pixelFormat == RGB_565);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_0300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: RGBA_8888
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_0400
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_0400', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: BGRA_8888
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, SHARE_MEMORY);
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == BGRA_8888);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_0500
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_0500', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: NV21
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, SHARE_MEMORY);
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == NV21);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_0600
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_0600', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_0600");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: NV12
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, SHARE_MEMORY);
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == NV12);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_0700
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_0700', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_0700");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 }
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions);
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_ERROR_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_ERROR_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_ERROR_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      try {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 },
          desiredPixelFormat: RGB_888
        };
        let imageSource = image.createImageSource(buffer);
        let pixelMap = await imageSource.createPixelMapUsingAllocator(decodingOptions);
        expect(false).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } catch (error) {
        logger.log("createPixelMapUsingAllocator error is: " + JSON.stringify(error));
        expect(error.code == DECODE_FAILED).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_ERROR_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_ERROR_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_ERROR_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_ERROR_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      try {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 30000, height: 30000 }
        };
        let imageSource = image.createImageSource(buffer);
        let pixelMap = await imageSource.createPixelMapUsingAllocator(decodingOptions);
        expect(false).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } catch (error) {
        logger.log("createPixelMapUsingAllocator error is: " + JSON.stringify(error));
        expect(error.code == IMAGE_TOO_LARGE).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_ERROR_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_ERROR_0300
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_ERROR_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_JPEG_ERROR_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      try {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
        let imageSource = image.createImageSource(buffer);
        let pixelMap = await imageSource.createPixelMapUsingAllocator();
        expect(false).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } catch (error) {
        logger.log("createPixelMapUsingAllocator error is: " + JSON.stringify(error));
        expect(error.code == IMAGE_TOO_LARGE).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 },
          desiredPixelFormat: RGB_565
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
        if (pixelMap != undefined) {
          let imageInfo = pixelMap.getImageInfoSync();
          logger.log("imageInfo is: " + JSON.stringify(imageInfo));
          let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGB_565);
          expect(ret).assertTrue();
          await pixelMap?.release();
          buffer = undefined;
          done();
        } else {
          logger.log("pixelMap is undefined!");
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 },
          desiredPixelFormat: RGBA_8888
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
        if (pixelMap != undefined) {
          let imageInfo = pixelMap.getImageInfoSync();
          logger.log("imageInfo is: " + JSON.stringify(imageInfo));
          let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
          expect(ret).assertTrue();
          await pixelMap?.release();
          buffer = undefined;
          done();
        } else {
          logger.log("pixelMap is undefined!");
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_0300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 },
          desiredPixelFormat: BGRA_8888
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
        if (pixelMap != undefined) {
          let imageInfo = pixelMap.getImageInfoSync();
          logger.log("imageInfo is: " + JSON.stringify(imageInfo));
          let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == BGRA_8888);
          expect(ret).assertTrue();
          await pixelMap?.release();
          buffer = undefined;
          done();
        } else {
          logger.log("pixelMap is undefined!");
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_0400
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_0400', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 },
          desiredPixelFormat: NV21
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
        if (pixelMap != undefined) {
          let imageInfo = pixelMap.getImageInfoSync();
          logger.log("imageInfo is: " + JSON.stringify(imageInfo));
          let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == NV21);
          expect(ret).assertTrue();
          await pixelMap?.release();
          buffer = undefined;
          done();
        } else {
          logger.log("pixelMap is undefined!");
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_0500
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_0500', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 },
          desiredPixelFormat: NV12
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
        if (pixelMap != undefined) {
          let imageInfo = pixelMap.getImageInfoSync();
          logger.log("imageInfo is: " + JSON.stringify(imageInfo));
          let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == NV12);
          expect(ret).assertTrue();
          await pixelMap?.release();
          buffer = undefined;
          done();
        } else {
          logger.log("pixelMap is undefined!");
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_0600
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_0600', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_0600");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 }
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions);
        if (pixelMap != undefined) {
          let imageInfo = pixelMap.getImageInfoSync();
          logger.log("imageInfo is: " + JSON.stringify(imageInfo));
          let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
          expect(ret).assertTrue();
          await pixelMap?.release();
          buffer = undefined;
          done();
        } else {
          logger.log("pixelMap is undefined!");
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_0700
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_0700', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_0700");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 },
          desiredRegion: { size: { width: 1500, height: 1500 }, x: 0, y: 0 },
          desiredPixelFormat: RGBA_8888,
          cropAndScaleStrategy: CROP_FIRST
        };
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions);
        if (pixelMap != undefined) {
          let imageInfo = pixelMap.getImageInfoSync();
          logger.log("imageInfo is: " + JSON.stringify(imageInfo));
          let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
          expect(ret).assertTrue();
          await pixelMap?.release();
          buffer = undefined;
          done();
        } else {
          logger.log("pixelMap is undefined!");
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_ERROR_0100
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_ERROR_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_ERROR_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        try {
          let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
          let decodingOptions: image.DecodingOptions = {
            desiredSize: { width: 4096, height: 4096 },
            desiredPixelFormat: RGB_888
          };
          let imageSource = image.createImageSource(buffer);
          let pixelMap = await imageSource.createPixelMapUsingAllocator(decodingOptions);
          logger.log("createPixelMapUsingAllocator result is : " + (pixelMap == undefined));
          expect(pixelMap == undefined).assertTrue();
          await pixelMap?.release();
          buffer = undefined;
          done();
        } catch (error) {
          logger.log("createPixelMapUsingAllocator error is: " + JSON.stringify(error));
          expect(error.code == DECODE_FAILED).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_ERROR_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_ERROR_0200
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_ERROR_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_ERROR_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        try {
          let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
          let decodingOptions: image.DecodingOptions = {
            desiredSize: { width: 30000, height: 30000 }
          };
          let imageSource = image.createImageSource(buffer);
          let pixelMap = await imageSource.createPixelMapUsingAllocator(decodingOptions);
          expect(false).assertTrue();
          await pixelMap?.release();
          buffer = undefined;
          done();
        } catch (error) {
          logger.log("createPixelMapUsingAllocator error is: " + JSON.stringify(error));
          expect(error.code == IMAGE_TOO_LARGE).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_ERROR_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_ERROR_0300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_ERROR_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_ERROR_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        try {
          let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
          let decodingOptions: image.DecodingOptions = {
            desiredSize: { width: 4096, height: 4096 }
          };
          let imageSource = image.createImageSource(buffer);
          let pixelMap = await imageSource.createPixelMapUsingAllocator(decodingOptions, SHARE_MEMORY);
          expect(false).assertTrue();
          await pixelMap?.release();
          buffer = undefined;
          done();
        } catch (error) {
          logger.log("createPixelMapUsingAllocator error is: " + JSON.stringify(error));
          expect(error.code == IMAGE_TOO_LARGE).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_ERROR_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_ERROR_0400
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_ERROR_0400', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_ERROR_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        try {
          let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
          let imageSource = image.createImageSource(buffer);
          let pixelMap = await imageSource.createPixelMapUsingAllocator();
          expect(false).assertTrue();
          await pixelMap?.release();
          buffer = undefined;
          done();
        } catch (error) {
          logger.log("createPixelMapUsingAllocator error is: " + JSON.stringify(error));
          expect(error.code == IMAGE_TOO_LARGE).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_ERROR_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_ERROR_0500
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_ERROR_0500', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_HEIC_ERROR_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 },
          desiredRegion: { size: { width: 1500, height: 1500 }, x: 0, y: 0 },
          desiredPixelFormat: RGB_565,
          cropAndScaleStrategy: SCALE_FIRST
        };
        try {
          let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
          let imageSource = image.createImageSource(buffer);
          let pixelMap = await imageSource.createPixelMapUsingAllocator(decodingOptions);
          expect(false).assertTrue();
          await pixelMap?.release();
          buffer = undefined;
          done();
        } catch (error) {
          logger.log("createPixelMapUsingAllocator error is: " + JSON.stringify(error));
          expect(error.code == FAILED_TO_ALLOCATE_MEMORY).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_PNG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_PNG_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_PNG_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_PNG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_PNG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredRegion: { size: { width: 1500, height: 1500 }, x: 0, y: 0 },
        desiredPixelFormat: RGBA_8888,
        cropAndScaleStrategy: CROP_FIRST
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_PNG_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_PNG_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_PNG_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_PNG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_PNG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: RGB_565
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGB_565);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_PNG_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_PNG_0300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_PNG_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_PNG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_PNG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: RGBA_8888
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_PNG_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_PNG_0400
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_PNG_0400', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_PNG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_PNG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: BGRA_8888
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, SHARE_MEMORY);
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == BGRA_8888);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_PNG_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_PNG_0500
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_PNG_0500', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_PNG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_PNG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 }
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions);
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_PNG_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_PNG_ERROR_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_PNG_ERROR_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_PNG_ERROR_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      try {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_PNG);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 },
          desiredPixelFormat: NV12
        };
        let imageSource = image.createImageSource(buffer);
        let pixelMap = await imageSource.createPixelMapUsingAllocator(decodingOptions);
        expect(false).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } catch (error) {
        logger.log("createPixelMapUsingAllocator error is: " + JSON.stringify(error));
        expect(error.code == IMAGE_TOO_LARGE).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_PNG_ERROR_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_PNG_ERROR_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_PNG_ERROR_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_PNG_ERROR_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      try {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_PNG);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 30000, height: 30000 }
        };
        let imageSource = image.createImageSource(buffer);
        let pixelMap = await imageSource.createPixelMapUsingAllocator(decodingOptions);
        expect(false).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } catch (error) {
        logger.log("createPixelMapUsingAllocator error is: " + JSON.stringify(error));
        expect(error.code == IMAGE_TOO_LARGE).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_PNG_ERROR_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_PNG_ERROR_0300
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_PNG_ERROR_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_PNG_ERROR_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      try {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_PNG);
        let imageSource = image.createImageSource(buffer);
        let pixelMap = await imageSource.createPixelMapUsingAllocator();
        expect(false).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } catch (error) {
        logger.log("createPixelMapUsingAllocator error is: " + JSON.stringify(error));
        expect(error.code == IMAGE_TOO_LARGE).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredRegion: { size: { width: 1124, height: 1400 }, x: 0, y: 0 },
        desiredPixelFormat: RGBA_8888,
        cropAndScaleStrategy: CROP_FIRST
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredRegion: { size: { width: 1124, height: 1400 }, x: 0, y: 0 },
        desiredPixelFormat: RGB_565,
        cropAndScaleStrategy: SCALE_FIRST
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1124) && (imageInfo.size.height == 1400) && (imageInfo.pixelFormat == RGB_565);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_0300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: RGBA_8888
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_0400
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_0400', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: BGRA_8888
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, SHARE_MEMORY);
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == BGRA_8888);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_0500
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_0500', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: NV21
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, SHARE_MEMORY);
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == NV21);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_0600
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_0600', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_0600");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: NV12
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, SHARE_MEMORY);
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == NV12);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_0700
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_0700', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_0700");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 }
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions);
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_ERROR_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_ERROR_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_ERROR_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      try {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 },
          desiredPixelFormat: RGB_888
        };
        let imageSource = image.createImageSource(buffer);
        let pixelMap = imageSource.createPixelMapUsingAllocatorSync(decodingOptions);
        expect(false).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } catch (error) {
        logger.log("createPixelMapUsingAllocatorSync error is: " + JSON.stringify(error));
        expect(error.code == DECODE_FAILED).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_ERROR_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_ERROR_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_ERROR_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_ERROR_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      try {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 30000, height: 30000 }
        };
        let imageSource = image.createImageSource(buffer);
        let pixelMap = imageSource.createPixelMapUsingAllocatorSync(decodingOptions);
        expect(false).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } catch (error) {
        logger.log("createPixelMapUsingAllocatorSync error is: " + JSON.stringify(error));
        expect(error.code == IMAGE_TOO_LARGE).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_ERROR_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_ERROR_0300
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_ERROR_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_JPEG_ERROR_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      try {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
        let imageSource = image.createImageSource(buffer);
        let pixelMap = imageSource.createPixelMapUsingAllocatorSync();
        expect(false).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } catch (error) {
        logger.log("createPixelMapUsingAllocatorSync error is: " + JSON.stringify(error));
        expect(error.code == IMAGE_TOO_LARGE).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 },
          desiredPixelFormat: RGB_565
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
        if (pixelMap != undefined) {
          let imageInfo = pixelMap.getImageInfoSync();
          logger.log("imageInfo is: " + JSON.stringify(imageInfo));
          let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGB_565);
          expect(ret).assertTrue();
          await pixelMap?.release();
          buffer = undefined;
          done();
        } else {
          logger.log("pixelMap is undefined!");
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 },
          desiredPixelFormat: RGBA_8888
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
        if (pixelMap != undefined) {
          let imageInfo = pixelMap.getImageInfoSync();
          logger.log("imageInfo is: " + JSON.stringify(imageInfo));
          let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
          expect(ret).assertTrue();
          await pixelMap?.release();
          buffer = undefined;
          done();
        } else {
          logger.log("pixelMap is undefined!");
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_0300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 },
          desiredPixelFormat: BGRA_8888
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
        if (pixelMap != undefined) {
          let imageInfo = pixelMap.getImageInfoSync();
          logger.log("imageInfo is: " + JSON.stringify(imageInfo));
          let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == BGRA_8888);
          expect(ret).assertTrue();
          await pixelMap?.release();
          buffer = undefined;
          done();
        } else {
          logger.log("pixelMap is undefined!");
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_0400
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_0400', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 },
          desiredPixelFormat: NV21
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
        if (pixelMap != undefined) {
          let imageInfo = pixelMap.getImageInfoSync();
          logger.log("imageInfo is: " + JSON.stringify(imageInfo));
          let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == NV21);
          expect(ret).assertTrue();
          await pixelMap?.release();
          buffer = undefined;
          done();
        } else {
          logger.log("pixelMap is undefined!");
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_0500
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_0500', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 },
          desiredPixelFormat: NV12
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
        if (pixelMap != undefined) {
          let imageInfo = pixelMap.getImageInfoSync();
          logger.log("imageInfo is: " + JSON.stringify(imageInfo));
          let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == NV12);
          expect(ret).assertTrue();
          await pixelMap?.release();
          buffer = undefined;
          done();
        } else {
          logger.log("pixelMap is undefined!");
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_0600
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_0600', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_0600");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 }
        };
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions);
        if (pixelMap != undefined) {
          let imageInfo = pixelMap.getImageInfoSync();
          logger.log("imageInfo is: " + JSON.stringify(imageInfo));
          let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
          expect(ret).assertTrue();
          await pixelMap?.release();
          buffer = undefined;
          done();
        } else {
          logger.log("pixelMap is undefined!");
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_0700
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_0700', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_0700");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 },
          desiredRegion: { size: { width: 1500, height: 1500 }, x: 0, y: 0 },
          desiredPixelFormat: RGBA_8888,
          cropAndScaleStrategy: CROP_FIRST
        };
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
        let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions);
        if (pixelMap != undefined) {
          let imageInfo = pixelMap.getImageInfoSync();
          logger.log("imageInfo is: " + JSON.stringify(imageInfo));
          let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
          expect(ret).assertTrue();
          await pixelMap?.release();
          buffer = undefined;
          done();
        } else {
          logger.log("pixelMap is undefined!");
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_ERROR_0100
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_ERROR_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_ERROR_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        try {
          let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
          let decodingOptions: image.DecodingOptions = {
            desiredSize: { width: 4096, height: 4096 },
            desiredPixelFormat: RGB_888
          };
          let imageSource = image.createImageSource(buffer);
          let pixelMap = imageSource.createPixelMapUsingAllocatorSync(decodingOptions);
          logger.log("createPixelMapUsingAllocator result is : " + (pixelMap == undefined));
          expect(pixelMap == undefined).assertTrue();
          await pixelMap?.release();
          buffer = undefined;
          done();
        } catch (error) {
          logger.log("createPixelMapUsingAllocatorSync error is: " + JSON.stringify(error));
          expect(error.code == DECODE_FAILED).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_ERROR_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_ERROR_0200
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_ERROR_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_ERROR_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        try {
          let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
          let decodingOptions: image.DecodingOptions = {
            desiredSize: { width: 30000, height: 30000 }
          };
          let imageSource = image.createImageSource(buffer);
          let pixelMap = imageSource.createPixelMapUsingAllocatorSync(decodingOptions);
          expect(false).assertTrue();
          await pixelMap?.release();
          buffer = undefined;
          done();
        } catch (error) {
          logger.log("createPixelMapUsingAllocatorSync error is: " + JSON.stringify(error));
          expect(error.code == IMAGE_TOO_LARGE).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_ERROR_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_ERROR_0300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_ERROR_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_ERROR_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        try {
          let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
          let decodingOptions: image.DecodingOptions = {
            desiredSize: { width: 4096, height: 4096 }
          };
          let imageSource = image.createImageSource(buffer);
          let pixelMap = imageSource.createPixelMapUsingAllocatorSync(decodingOptions, SHARE_MEMORY);
          expect(false).assertTrue();
          await pixelMap?.release();
          buffer = undefined;
          done();
        } catch (error) {
          logger.log("createPixelMapUsingAllocatorSync error is: " + JSON.stringify(error));
          expect(error.code == IMAGE_TOO_LARGE).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_ERROR_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_ERROR_0400
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_ERROR_0400', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_ERROR_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        try {
          let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
          let imageSource = image.createImageSource(buffer);
          let pixelMap = imageSource.createPixelMapUsingAllocatorSync();
          expect(false).assertTrue();
          await pixelMap?.release();
          buffer = undefined;
          done();
        } catch (error) {
          logger.log("createPixelMapUsingAllocatorSync error is: " + JSON.stringify(error));
          expect(error.code == IMAGE_TOO_LARGE).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_ERROR_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_ERROR_0500
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_ERROR_0500', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_HEIC_ERROR_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 },
          desiredRegion: { size: { width: 1500, height: 1500 }, x: 0, y: 0 },
          desiredPixelFormat: RGB_565,
          cropAndScaleStrategy: SCALE_FIRST
        };
        try {
          let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
          let imageSource = image.createImageSource(buffer);
          let pixelMap = imageSource.createPixelMapUsingAllocatorSync(decodingOptions);
          expect(false).assertTrue();
          await pixelMap?.release();
          buffer = undefined;
          done();
        } catch (error) {
          logger.log("createPixelMapUsingAllocatorSync error is: " + JSON.stringify(error));
          expect(error.code == FAILED_TO_ALLOCATE_MEMORY).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_PNG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_PNG_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_PNG_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_PNG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let filePath = getFilePath(TEST_DECODE_LARGE_IMAGE_PNG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredRegion: { size: { width: 1500, height: 1500 }, x: 0, y: 0 },
        desiredPixelFormat: RGBA_8888,
        cropAndScaleStrategy: CROP_FIRST
      };

      let verifyDecodeOpts: exceptDecodeOptions = {
        expectedWidth: 4096,
        expectedHeight: 4096,
        expectedPixelFormat: RGBA_8888
      }
      let ret = await createPixelMapSyncDmaInTaskPool(logger, filePath, decodingOptions, DMA, verifyDecodeOpts);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_PNG_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_PNG_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_PNG_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_PNG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let filePath = getFilePath(TEST_DECODE_LARGE_IMAGE_PNG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: RGB_565
      };

      let verifyDecodeOpts: exceptDecodeOptions = {
        expectedWidth: 4096,
        expectedHeight: 4096,
        expectedPixelFormat: RGB_565
      }
      let ret = await createPixelMapSyncDmaInTaskPool(logger, filePath, decodingOptions, DMA, verifyDecodeOpts);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_PNG_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_PNG_0300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_PNG_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_PNG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let filePath = getFilePath(TEST_DECODE_LARGE_IMAGE_PNG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: RGBA_8888
      };

      let verifyDecodeOpts: exceptDecodeOptions = {
        expectedWidth: 4096,
        expectedHeight: 4096,
        expectedPixelFormat: RGBA_8888
      }
      let ret = await createPixelMapSyncDmaInTaskPool(logger, filePath, decodingOptions, DMA, verifyDecodeOpts);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_PNG_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_PNG_0400
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_PNG_0400', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_PNG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let filePath = getFilePath(TEST_DECODE_LARGE_IMAGE_PNG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: BGRA_8888
      };

      let verifyDecodeOpts: exceptDecodeOptions = {
        expectedWidth: 4096,
        expectedHeight: 4096,
        expectedPixelFormat: BGRA_8888
      }
      let ret = await createPixelMapSyncDmaInTaskPool(logger, filePath, decodingOptions, SHARE_MEMORY, verifyDecodeOpts);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_PNG_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_PNG_0500
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_PNG_0500', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_PNG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let filePath = getFilePath(TEST_DECODE_LARGE_IMAGE_PNG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 }
      };

      let verifyDecodeOpts: exceptDecodeOptions = {
        expectedWidth: 4096,
        expectedHeight: 4096,
        expectedPixelFormat: RGBA_8888
      }
      let ret = await createPixelMapSyncDmaInTaskPool(logger, filePath, decodingOptions, AUTO, verifyDecodeOpts);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_PNG_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_PNG_ERROR_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_PNG_ERROR_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_PNG_ERROR_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      try {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_PNG);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 },
          desiredPixelFormat: NV12
        };
        let imageSource = image.createImageSource(buffer);
        let pixelMap = imageSource.createPixelMapUsingAllocatorSync(decodingOptions);
        expect(false).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } catch (error) {
        logger.log("createPixelMapUsingAllocatorSync error is: " + JSON.stringify(error));
        expect(error.code == IMAGE_TOO_LARGE).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_PNG_ERROR_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_PNG_ERROR_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_PNG_ERROR_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_PNG_ERROR_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      try {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_PNG);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 30000, height: 30000 }
        };
        let imageSource = image.createImageSource(buffer);
        let pixelMap = imageSource.createPixelMapUsingAllocatorSync(decodingOptions);
        expect(false).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } catch (error) {
        logger.log("createPixelMapUsingAllocatorSync error is: " + JSON.stringify(error));
        expect(error.code == IMAGE_TOO_LARGE).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_PNG_ERROR_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_PNG_ERROR_0300
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_PNG_ERROR_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_FOR_LARGE_IMAGE_SYNC_PNG_ERROR_0300");
	  if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      try {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_PNG);
        let imageSource = image.createImageSource(buffer);
        let pixelMap = imageSource.createPixelMapUsingAllocatorSync();
        expect(false).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } catch (error) {
        logger.log("createPixelMapUsingAllocatorSync error is: " + JSON.stringify(error));
        expect(error.code == IMAGE_TOO_LARGE).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_ARW_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_ARW_0100
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_SONY_A350.ARW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_ARW_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_ARW_0100");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_SONY_A350.ARW");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1920) && (imageInfo.size.height == 1080) && (imageInfo.mimeType == "image/x-sony-arw");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_ARW_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_ARW_0200
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_SONY_A900.ARW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_ARW_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_ARW_0200");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_SONY_A900.ARW");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1616) && (imageInfo.size.height == 1080) && (imageInfo.mimeType == "image/x-sony-arw");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_CR2_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_CR2_0300
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_CANON_G9.CR2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_CR2_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_CR2_0300");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_CANON_G9.CR2");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1600) && (imageInfo.size.height == 1200) && (imageInfo.mimeType == "image/x-canon-cr2");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_CR2_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_CR2_0400
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_CANON_G10.CR2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_CR2_0400', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_CR2_0400");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_CANON_G10.CR2");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1600) && (imageInfo.size.height == 1200) && (imageInfo.mimeType == "image/x-canon-cr2");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_NEF_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_NEF_0500
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_NIKON_D90.NEF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_NEF_0500', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_NEF_0500");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_NIKON_D90.NEF");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4288) && (imageInfo.size.height == 2848) && (imageInfo.mimeType == "image/x-nikon-nef");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_NEF_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_NEF_0600
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_NIKON_D3300.NEF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_NEF_0600', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_NEF_0600");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_NIKON_D3300.NEF");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1620) && (imageInfo.size.height == 1080) && (imageInfo.mimeType == "image/x-nikon-nef");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_NRW_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_NRW_0700
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_NIKON_COOLPIX_P340.NRW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_NRW_0700', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_NRW_0700");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_NIKON_COOLPIX_P340.NRW");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4000) && (imageInfo.size.height == 3000) && (imageInfo.mimeType == "image/x-nikon-nrw");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_NRW_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_NRW_0800
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_NIKON_P6000_GPS.NRW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_NRW_0800', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_NRW_0800");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_NIKON_P6000_GPS.NRW");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4224) && (imageInfo.size.height == 3168) && (imageInfo.mimeType == "image/x-nikon-nrw");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_ORF_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_ORF_0900
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_OLYMPUS_E3.ORF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_ORF_0900', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_ORF_0900");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_OLYMPUS_E3.ORF");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1600) && (imageInfo.size.height == 1200) && (imageInfo.mimeType == "image/x-olympus-orf");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_ORF_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_ORF_1000
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_OLYMPUS_E410.ORF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_ORF_1000', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_ORF_1000");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_OLYMPUS_E410.ORF");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1600) && (imageInfo.size.height == 1200) && (imageInfo.mimeType == "image/x-olympus-orf");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_PEF_1100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_PEF_1100
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_PENTAX_STAR_DL.PEF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_PEF_1100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_PEF_1100");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_PENTAX_STAR_DL.PEF");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 3008) && (imageInfo.size.height == 2000) && (imageInfo.mimeType == "image/x-pentax-pef");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_PEF_1200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_PEF_1200
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_PENTAX_STARISTD_SRGB.PEF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_PEF_1200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_PEF_1200");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_PENTAX_STARISTD_SRGB.PEF");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 3008) && (imageInfo.size.height == 2008) && (imageInfo.mimeType == "image/x-pentax-pef");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_RAF_1300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_RAF_1300
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_FUJI_S6500FD.RAF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_RAF_1300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_RAF_1300");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_FUJI_S6500FD.RAF");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1600) && (imageInfo.size.height == 1200) && (imageInfo.mimeType == "image/x-fuji-raf");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_RAF_1400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_RAF_1400
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_FUJI_S9500_SRGB.RAF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_RAF_1400', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_RAF_1400");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_FUJI_S9500_SRGB.RAF");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1600) && (imageInfo.size.height == 1200) && (imageInfo.mimeType == "image/x-fuji-raf");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_RW2_1500
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_RW2_1500
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_PANASONIC_G1.RW2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_RW2_1500', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_RW2_1500");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_PANASONIC_G1.RW2");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1920) && (imageInfo.size.height == 1440) && (imageInfo.mimeType == "image/x-panasonic-rw2");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_RW2_1600
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_RW2_1600
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_PANASONIC_LX3.RW2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_RW2_1600', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_RW2_1600");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_PANASONIC_LX3.RW2");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1920) && (imageInfo.size.height == 1080) && (imageInfo.mimeType == "image/x-panasonic-rw2");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_SRW_1700
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_SRW_1700
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_SAMSUNG_EX2F.SRW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_SRW_1700', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_SRW_1700");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_SAMSUNG_EX2F.SRW");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4000) && (imageInfo.size.height == 2248) && (imageInfo.mimeType == "image/x-samsung-srw");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_CR3_1800
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_CR3_1800
     * @tc.desc   1.create pixelMap object by imageSource -- 023A9785.CR3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_CR3_1800', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_CR3_1800");
      let buffer: ArrayBuffer | undefined = await getBuffer("023A9785.CR3");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1620) && (imageInfo.size.height == 1080) && (imageInfo.mimeType == "image/x-canon-cr3");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_CR3_1900
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_CR3_1900
     * @tc.desc   1.create pixelMap object by imageSource -- 023A9867.CR3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_CR3_1900', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_RAW_CR3_1900");
      let buffer: ArrayBuffer | undefined = await getBuffer("023A9867.CR3");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1620) && (imageInfo.size.height == 1080) && (imageInfo.mimeType == "image/x-canon-cr3");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_ARW_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_ARW_0100
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_SONY_A350.ARW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_ARW_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_ARW_0100");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_SONY_A350.ARW");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1920) && (imageInfo.size.height == 1080) && (imageInfo.mimeType == "image/x-sony-arw");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_ARW_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_ARW_0200
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_SONY_A900.ARW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_ARW_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_ARW_0200");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_SONY_A900.ARW");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1616) && (imageInfo.size.height == 1080) && (imageInfo.mimeType == "image/x-sony-arw");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_CR2_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_CR2_0300
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_CANON_G9.CR2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_CR2_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_CR2_0300");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_CANON_G9.CR2");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1600) && (imageInfo.size.height == 1200) && (imageInfo.mimeType == "image/x-canon-cr2");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_CR2_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_CR2_0400
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_CANON_G10.CR2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_CR2_0400', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_CR2_0400");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_CANON_G10.CR2");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1600) && (imageInfo.size.height == 1200) && (imageInfo.mimeType == "image/x-canon-cr2");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_NEF_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_NEF_0500
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_NIKON_D90.NEF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_NEF_0500', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_NEF_0500");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_NIKON_D90.NEF");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4288) && (imageInfo.size.height == 2848) && (imageInfo.mimeType == "image/x-nikon-nef");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_NEF_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_NEF_0600
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_NIKON_D3300.NEF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_NEF_0600', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_NEF_0600");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_NIKON_D3300.NEF");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1620) && (imageInfo.size.height == 1080) && (imageInfo.mimeType == "image/x-nikon-nef");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_NRW_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_NRW_0700
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_NIKON_COOLPIX_P340.NRW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_NRW_0700', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_NRW_0700");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_NIKON_COOLPIX_P340.NRW");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4000) && (imageInfo.size.height == 3000) && (imageInfo.mimeType == "image/x-nikon-nrw");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_NRW_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_NRW_0800
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_NIKON_P6000_GPS.NRW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_NRW_0800', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_NRW_0800");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_NIKON_P6000_GPS.NRW");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4224) && (imageInfo.size.height == 3168) && (imageInfo.mimeType == "image/x-nikon-nrw");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_ORF_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_ORF_0900
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_OLYMPUS_E3.ORF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_ORF_0900', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_ORF_0900");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_OLYMPUS_E3.ORF");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1600) && (imageInfo.size.height == 1200) && (imageInfo.mimeType == "image/x-olympus-orf");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_ORF_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_ORF_1000
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_OLYMPUS_E410.ORF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_ORF_1000', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_ORF_1000");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_OLYMPUS_E410.ORF");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1600) && (imageInfo.size.height == 1200) && (imageInfo.mimeType == "image/x-olympus-orf");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_PEF_1100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_PEF_1100
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_PENTAX_STAR_DL.PEF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_PEF_1100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_PEF_1100");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_PENTAX_STAR_DL.PEF");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 3008) && (imageInfo.size.height == 2000) && (imageInfo.mimeType == "image/x-pentax-pef");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_PEF_1200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_PEF_1200
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_PENTAX_STARISTD_SRGB.PEF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_PEF_1200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_PEF_1200");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_PENTAX_STARISTD_SRGB.PEF");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 3008) && (imageInfo.size.height == 2008) && (imageInfo.mimeType == "image/x-pentax-pef");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_RAF_1300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_RAF_1300
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_FUJI_S6500FD.RAF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_RAF_1300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_RAF_1300");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_FUJI_S6500FD.RAF");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1600) && (imageInfo.size.height == 1200) && (imageInfo.mimeType == "image/x-fuji-raf");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_RAF_1400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_RAF_1400
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_FUJI_S9500_SRGB.RAF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_RAF_1400', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_RAF_1400");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_FUJI_S9500_SRGB.RAF");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1600) && (imageInfo.size.height == 1200) && (imageInfo.mimeType == "image/x-fuji-raf");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_RW2_1500
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_RW2_1500
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_PANASONIC_G1.RW2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_RW2_1500', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_RW2_1500");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_PANASONIC_G1.RW2");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1920) && (imageInfo.size.height == 1440) && (imageInfo.mimeType == "image/x-panasonic-rw2");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_RW2_1600
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_RW2_1600
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_PANASONIC_LX3.RW2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_RW2_1600', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_RW2_1600");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_PANASONIC_LX3.RW2");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1920) && (imageInfo.size.height == 1080) && (imageInfo.mimeType == "image/x-panasonic-rw2");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_SRW_1700
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_SRW_1700
     * @tc.desc   1.create pixelMap object by imageSource -- RAW_SAMSUNG_EX2F.SRW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_SRW_1700', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_SRW_1700");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_SAMSUNG_EX2F.SRW");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4000) && (imageInfo.size.height == 2248) && (imageInfo.mimeType == "image/x-samsung-srw");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_CR3_1800
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_CR3_1800
     * @tc.desc   1.create pixelMap object by imageSource -- 023A9785.CR3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_CR3_1800', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_CR3_1800");
      let buffer: ArrayBuffer | undefined = await getBuffer("023A9785.CR3");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1620) && (imageInfo.size.height == 1080) && (imageInfo.mimeType == "image/x-canon-cr3");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_CR3_1900
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_CR3_1900
     * @tc.desc   1.create pixelMap object by imageSource -- 023A9867.CR3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_CR3_1900', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FROM_ALLOCATOR_SYNC_RAW_CR3_1900");
      let buffer: ArrayBuffer | undefined = await getBuffer("023A9867.CR3");
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync");
      if (pixelMap != undefined) {
        let imageInfo = pixelMap.getImageInfoSync();
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1620) && (imageInfo.size.height == 1080) && (imageInfo.mimeType == "image/x-canon-cr3");
        expect(ret).assertTrue();
        await pixelMap?.release();
        buffer = undefined;
        done();
      } else {
        logger.log("pixelMap is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_0100
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_0100");
      let buffer: ESObject = await getBuffer(test_wbmp);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 99, height: 200 },
        desiredPixelFormat: RGB_565,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, AUTO);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, AUTO, "image/wbmp");
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_0200
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_0200");
      let buffer: ESObject = await getBuffer(test_wbmp);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 512, height: 512 },
        desiredPixelFormat: BGRA_8888,
        desiredDynamicRange: RANGE_HDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, AUTO);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, AUTO, "image/wbmp");
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_0300
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_0300");
      let buffer: ESObject = await getBuffer(test_wbmp);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4001, height: 4096 },
        desiredPixelFormat: NV21,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, SHARE_MEMORY);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY, "image/wbmp");
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_0400
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_0400");
      let buffer: ESObject = await getBuffer(test_wbmp);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 99, height: 200 },
        desiredPixelFormat: NV12,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, SHARE_MEMORY);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY, "image/wbmp");
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_0500
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_0500");
      let buffer: ESObject = await getBuffer(test_wbmp);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 512, height: 512 },
        desiredPixelFormat: YCBCR_P010,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, DMA, "image/wbmp");
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_0600
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_0600', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_0600");
      let buffer: ESObject = await getBuffer(test_wbmp);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3072, height: 4096 },
        desiredPixelFormat: YCRCB_P010,
        desiredDynamicRange: RANGE_HDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, DMA, "image/wbmp");
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_SYNC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_SYNC_0100
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_SYNC_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_SYNC_0100");
      let buffer: ESObject = await getBuffer(test_wbmp);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 99, height: 200 },
        desiredPixelFormat: RGB_565,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, AUTO);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, AUTO, "image/wbmp");
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_SYNC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_SYNC_0200
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_SYNC_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_SYNC_0200");
      let buffer: ESObject = await getBuffer(test_wbmp);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 512, height: 512 },
        desiredPixelFormat: BGRA_8888,
        desiredDynamicRange: RANGE_HDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, AUTO);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, AUTO, "image/wbmp");
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_SYNC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_SYNC_0300
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_SYNC_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_SYNC_0300");
      let buffer: ESObject = await getBuffer(test_wbmp);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4001, height: 4096 },
        desiredPixelFormat: NV21,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, SHARE_MEMORY);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY, "image/wbmp");
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_SYNC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_SYNC_0400
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_SYNC_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_SYNC_0400");
      let buffer: ESObject = await getBuffer(test_wbmp);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 99, height: 200 },
        desiredPixelFormat: NV12,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, SHARE_MEMORY);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY, "image/wbmp");
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_SYNC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_SYNC_0500
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_SYNC_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_SYNC_0500");
      let buffer: ESObject = await getBuffer(test_wbmp);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 512, height: 512 },
        desiredPixelFormat: YCBCR_P010,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, DMA, "image/wbmp");
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_SYNC_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_SYNC_0600
     * @tc.desc   1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_SYNC_0600', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_SYNC_0600");
      let buffer: ESObject = await getBuffer(test_wbmp);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 3072, height: 4096 },
        desiredPixelFormat: YCRCB_P010,
        desiredDynamicRange: RANGE_HDR
      };
      let pixelMap = await getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
      let imageInfo = await getImageInfo(logger, buffer, decodingOptions);
      let ret = await checkPixelmap(done, logger, pixelMap, imageInfo, DMA, "image/wbmp");
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      await pixelMap?.release();
      buffer = undefined;
      done();
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0100
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set decodingOptions
     *                    desiredPixelFormat: RGB_565
     *                    desiredSize: { width: 2048, height: 2048 }
     *                 3.return imageInfo
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0100");
      if (!isSupportTiff) {
        logger.log("device is not support tiff");
        done();
        return;
      }
      let decodingOptions: image.DecodingOptions = {
        desiredPixelFormat: RGB_565,
        desiredSize: { width: 2048, height: 2048 }
      };

      let ret = await testDecodeTiff(logger, false, '1920x1080_Deflate.tiff', decodingOptions, 'image/tiff', AUTO);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0200
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set decodingOptions
     *                    desiredPixelFormat: RGB_565
     *                    desiredSize: { width: 2048, height: 2048 }
     *                 3.return imageInfo
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0200', Level.LEVEL0, async (done: () => void) => {
      const logger = new Logger('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0200');
      if (!isSupportTiff) {
        logger.log("device is not support tiff");
        done();
        return;
      }
      const decodingOptions: image.DecodingOptions = {
        desiredPixelFormat: RGB_565,
        desiredSize: { width: 2048, height: 2048 }
      };

      const ret = await testDecodeTiff(logger, false, '1920x1080_G3.tiff', decodingOptions, 'image/tiff', AUTO);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0300
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set decodingOptions
     *                    desiredPixelFormat: RGB_565
     *                    desiredSize: { width: 2048, height: 2048 }
     *                 3.return imageInfo
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0300', Level.LEVEL0, async (done: () => void) => {
      const logger = new Logger('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0300');
      if (!isSupportTiff) {
        logger.log("device is not support tiff");
        done();
        return;
      }
      const decodingOptions: image.DecodingOptions = {
        desiredPixelFormat: RGB_565,
        desiredSize: { width: 2048, height: 2048 }
      };

      const ret = await testDecodeTiff(logger, false, '1920x1080_G4.tiff', decodingOptions, 'image/tiff', AUTO);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0400
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set decodingOptions
     *                    desiredPixelFormat: RGB_565
     *                    desiredSize: { width: 2048, height: 2048 }
     *                 3.return imageInfo
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0400', Level.LEVEL0, async (done: () => void) => {
      const logger = new Logger('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0400');
      if (!isSupportTiff) {
        logger.log("device is not support tiff");
        done();
        return;
      }
      const decodingOptions: image.DecodingOptions = {
        desiredPixelFormat: RGB_565,
        desiredSize: { width: 2048, height: 2048 }
      };

      const ret = await testDecodeTiff(logger, false, '1920x1080_Jpeg.tiff', decodingOptions, 'image/tiff', SHARE_MEMORY);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0500
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set decodingOptions
     *                    desiredPixelFormat: RGBA_8888
     *                    desiredSize: { width: 2048, height: 2048 }
     *                 3.return imageInfo
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0500', Level.LEVEL0, async (done: () => void) => {
      const logger = new Logger('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0500');
      if (!isSupportTiff) {
        logger.log("device is not support tiff");
        done();
        return;
      }
      const decodingOptions: image.DecodingOptions = {
        desiredPixelFormat: RGBA_8888,
        desiredSize: { width: 2048, height: 2048 }
      };

      const ret = await testDecodeTiff(logger, false, '1920x1080_Lzw.tiff', decodingOptions, 'image/tiff', SHARE_MEMORY);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0600
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set decodingOptions
     *                    desiredPixelFormat: RGBA_8888
     *                    desiredSize: { width: 2048, height: 2048 }
     *                 3.return imageInfo
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0600', Level.LEVEL0, async (done: () => void) => {
      const logger = new Logger('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0600');
      if (!isSupportTiff) {
        logger.log("device is not support tiff");
        done();
        return;
      }
      const decodingOptions: image.DecodingOptions = {
        desiredPixelFormat: RGBA_8888,
        desiredSize: { width: 2048, height: 2048 }
      };

      const ret = await testDecodeTiff(logger, false, '1920x1080_Next.tiff', decodingOptions, 'image/tiff', SHARE_MEMORY);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0700
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set decodingOptions
     *                    desiredPixelFormat: RGBA_8888
     *                    desiredSize: { width: 2048, height: 2048 }
     *                 3.return imageInfo
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0700', Level.LEVEL0, async (done: () => void) => {
      const logger = new Logger('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0700');
      if (!isSupportTiff) {
        logger.log("device is not support tiff");
        done();
        return;
      }
      const decodingOptions: image.DecodingOptions = {
        desiredPixelFormat: RGBA_8888,
        desiredSize: { width: 2048, height: 2048 }
      };

      const ret = await testDecodeTiff(logger, true, '1920x1080_none.tiff', decodingOptions, 'image/tiff', SHARE_MEMORY);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0800
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0800
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set decodingOptions
     *                    desiredPixelFormat: RGBA_8888
     *                    desiredSize: { width: 2048, height: 2048 }
     *                 3.return imageInfo
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0800', Level.LEVEL0, async (done: () => void) => {
      const logger = new Logger('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0800');
      if (!isSupportTiff) {
        logger.log("device is not support tiff");
        done();
        return;
      }
      const decodingOptions: image.DecodingOptions = {
        desiredPixelFormat: RGBA_8888,
        desiredSize: { width: 2048, height: 2048 }
      };

      const ret = await testDecodeTiff(logger, true, '1920x1080_Packbits.tiff', decodingOptions, 'image/tiff', DMA);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0900
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0900
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set decodingOptions
     *                    desiredPixelFormat: BGRA_8888
     *                    desiredSize: { width: 2048, height: 2048 }
     *                 3.return imageInfo
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0900', Level.LEVEL0, async (done: () => void) => {
      const logger = new Logger('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_0900');
      if (!isSupportTiff) {
        logger.log("device is not support tiff");
        done();
        return;
      }
      const decodingOptions: image.DecodingOptions = {
        desiredPixelFormat: BGRA_8888,
        desiredSize: { width: 2048, height: 2048 }
      };

      const ret = await testDecodeTiff(logger, true, '1920x1080_PixarLog_RGB.tiff', decodingOptions, 'image/tiff', DMA);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_1000
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_1000
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set decodingOptions
     *                    desiredPixelFormat: BGRA_8888
     *                    desiredSize: { width: 2048, height: 2048 }
     *                    desiredRegion: { size: { width: 150, height: 150 }, x: 0, y: 0 }
     *                    cropAndScaleStrategy: CROP_FIRST
     *                 3.return imageInfo
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_1000', Level.LEVEL0, async (done: () => void) => {
      const logger = new Logger('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_1000');
      if (!isSupportTiff) {
        logger.log("device is not support tiff");
        done();
        return;
      }
      const decodingOptions: image.DecodingOptions = {
        desiredPixelFormat: BGRA_8888,
        desiredSize: { width: 2048, height: 2048 },
        desiredRegion: { size: { width: 150, height: 150 }, x: 0, y: 0 },
        cropAndScaleStrategy: CROP_FIRST
      };

      const ret = await testDecodeTiff(logger, true, '1920x1080_SGILOG_gray16.tiff', decodingOptions, 'image/tiff', DMA);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_1100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_1100
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set decodingOptions
     *                    desiredPixelFormat: BGRA_8888
     *                    desiredSize: { width: 2048, height: 2048 }
     *                    desiredRegion: { size: { width: 150, height: 150 }, x: 0, y: 0 }
     *                    cropAndScaleStrategy: SCALE_FIRST
     *                 3.return imageInfo
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_1100', Level.LEVEL0, async (done: () => void) => {
      const logger = new Logger('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_1100');
      if (!isSupportTiff) {
        logger.log("device is not support tiff");
        done();
        return;
      }
      const decodingOptions: image.DecodingOptions = {
        desiredPixelFormat: BGRA_8888,
        desiredSize: { width: 2048, height: 2048 },
        desiredRegion: { size: { width: 150, height: 150 }, x: 0, y: 0 },
        cropAndScaleStrategy: SCALE_FIRST
      };

      const ret = await testDecodeTiff(logger, true, 'thunderscan-1920x1080.tiff', decodingOptions, 'image/tiff', DMA);
      expect(ret).assertTrue();
      done();
    });
  })
}