/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import image from '@ohos.multimedia.image';
import fs from '@ohos.file.fs';
import common from '@ohos.app.ability.common';
import hdrCapability from '@ohos.graphics.hdrCapability';
import display from '@ohos.display';
import { BusinessError } from '@ohos.base';
import { initialize } from './AbilityContextHelper.test';

class Logger {
  testNum: string;

  constructor(testNum: string) {
    this.testNum = testNum;
  }

  log(msg: string) {
    hilog.info(0x0000, "imagePixelmap", 'case: %{public}s msg:%{public}s', this.testNum, msg);
  }
}

function sleep(count:int) : Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, count)
  })
}
export default function imagePixelmap() {
  let filesDir: string | undefined | null;
  let cacheDir: string | undefined | null;
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
  const test_DMA_HDR       = "CUVAHdrMulti.jpg";
  const test_DMA_33_77     = "test_DMA_33_77.jpg";
  const test_DMA_55_77     = "test_DMA_55_77.jpg";
  const test_DMA_128_256   = "test_DMA_128_256.jpg";
  const test_DMA_512_512   = "test_DMA_512_512.jpg";
  const test_DMA_1801_4041 = "test_DMA_1801_4041.jpg";
  const test_DMA_2999_3742 = "test_DMA_2999_3742.jpg";
  const test_DMA_3072_4096 = "test_DMA_3072_4096.jpg";
  const test_DMA_3071_4095 = "test_DMA_3071_4095.jpg";

  describe('imagePixelMapForDMA', () => {
    beforeAll(async () => {
      await initialize();
      filesDir = Hypium.get('filesDir') as string | undefined | null;
      cacheDir = Hypium.get('cacheDir') as string | undefined | null;
      testContext = Hypium.get('context') as common.UIAbilityContext;
      isSupportHEIFDecode =
        image.createImageSource(filesDir + '/' + "test.jpg")!.supportedFormats.includes("image/heic");
      // isSupportHdr = 
      //   !display.getDefaultDisplaySync().hdrFormats.includes(hdrCapability.HDRFormat.NONE) &&
      //     display.getDefaultDisplaySync().hdrFormats.length != 0;
      try {
        isSupportHdr = await fs.access('/system/lib64/ndk/libvideo_processing_capi_impl.so');
      } catch (err) {
        console.error("access failed with error message: " + err.message + ", error code: " + err.code);
        isSupportHdr = false;
      }
    })

    afterEach(async () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'afterEach case');
      await sleep(3000);
    });

    const getBuffer = (fileName: string) => {
      const filePath = filesDir + '/' + fileName;
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead);
      fs.closeSync(file.fd);
      return bufferRead;
    }

    const getImageInfo = (logger: Logger, buffer: ArrayBuffer, decodingOptions?: image.DecodingOptions) => {
      let imageSource = image.createImageSource(buffer);
      if (imageSource == undefined) {
        logger.log("create imageSource failed.")
        return undefined;
      }
      let pixelMap: image.PixelMap | undefined = undefined;
      let imageInfo: image.ImageInfo | undefined = undefined;
      if (decodingOptions != undefined) {
        waitForCompletion(async () => {pixelMap = await imageSource!.createPixelMap(decodingOptions);})
      } else {
        waitForCompletion(async () => {pixelMap = await imageSource!.createPixelMap();})
      }
      waitForCompletion(async () => {await imageSource!.release();})
      if (pixelMap == undefined) {
        logger.log("create pixelMap failed.")
        return undefined;
      }
      waitForCompletion(async () => {imageInfo = await pixelMap!.getImageInfo();})
      waitForCompletion(async () => {await pixelMap!.release();})
      return imageInfo;
    }

    const getPixelmapFromAllocator = (
      logger: Logger,
      buffer: ArrayBuffer,
      type: string,
      decodingOptions?: image.DecodingOptions,
      allocatorType?: image.AllocatorType
    ): image.ImageInfo | undefined => {
      let pixelMap: image.PixelMap | undefined;
      try {
        let imageSource = image.createImageSource(buffer);
        if (imageSource == undefined) {
          return undefined;
        }
        if (type == "sync") {
          if (decodingOptions != undefined && allocatorType == undefined) {
            pixelMap = imageSource.createPixelMapUsingAllocatorSync(decodingOptions);
          } else if (decodingOptions != undefined && allocatorType != undefined) {
            pixelMap = imageSource.createPixelMapUsingAllocatorSync(decodingOptions, allocatorType);
          } else if (decodingOptions == undefined && allocatorType == undefined) {
            pixelMap = imageSource.createPixelMapUsingAllocatorSync();
          }
        } else {
          if (decodingOptions != undefined && allocatorType == undefined) {
            waitForCompletion(async () => {pixelMap = await imageSource!.createPixelMapUsingAllocator(decodingOptions);})
          } else if (decodingOptions != undefined && allocatorType != undefined) {
            waitForCompletion(async () => {pixelMap = await imageSource!.createPixelMapUsingAllocator(decodingOptions, allocatorType);})
          } else if (decodingOptions == undefined && allocatorType == undefined) {
            waitForCompletion(async () => {pixelMap = await imageSource!.createPixelMapUsingAllocator();})
          }
        }
        waitForCompletion(async () => {await imageSource!.release();})
      } catch (error) {
        logger.log("getPixelmapFromAllocator error is: " + JSON.stringify(error));
        logger.log('Failed to create pixelMap.');
      }
      if(pixelMap != undefined) {
        let dstImageInfo: image.ImageInfo | undefined;
        waitForCompletion(async () => {dstImageInfo = await pixelMap!.getImageInfo();})
        waitForCompletion(async () => {await pixelMap!.release();})
        return dstImageInfo;
      } else {
        return undefined;
      }
    }

    const getPixelMapFormatBytes = (pixelFormat: image.PixelMapFormat) => {
      let fromatBytes = 0;
      switch (pixelFormat) {
        case image.PixelMapFormat.RGB_565:
        case image.PixelMapFormat.NV21:
        case image.PixelMapFormat.NV12:
          fromatBytes = 2;
          break;
        case image.PixelMapFormat.RGBA_8888:
        case image.PixelMapFormat.BGRA_8888:
        case image.PixelMapFormat.RGBA_1010102:
        case image.PixelMapFormat.YCBCR_P010:
        case image.PixelMapFormat.YCRCB_P010:
          fromatBytes = 4;
          break;
        case image.PixelMapFormat.RGBA_F16:
          fromatBytes = 8;
          break;
      }
      return fromatBytes;
    }

    const checkPixelmap = (
      done: () => void,
      logger: Logger,
      dstImageInfo: image.ImageInfo | undefined,
      originImageInfo: image.ImageInfo | undefined,
      allocatorType: image.AllocatorType = AUTO
    ): boolean => {
      let ret = false;
      if(dstImageInfo != undefined && originImageInfo != undefined) {
        logger.log("originImageInfo is:" + JSON.stringify(originImageInfo));
        logger.log("dstImageInfo is:" + JSON.stringify(dstImageInfo));
        ret = (dstImageInfo != undefined) &&
              (dstImageInfo.size.height == originImageInfo.size.height) &&
              (dstImageInfo.size.width  == originImageInfo.size.width);
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_SYNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_SYNC_STATIC_0100
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_SYNC_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_SYNC_STATIC_0100");
      const buffer = getBuffer("test.gif");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 99, height: 200},
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, SHARE_MEMORY);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_SYNC_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_SYNC_STATIC_0200
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_SYNC_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_SYNC_STATIC_0200");
      const buffer = getBuffer("test.gif");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 3071, height: 4096},
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_SYNC_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_SYNC_STATIC_0300
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_SYNC_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_SYNC_STATIC_0300");
      const buffer = getBuffer("test.gif");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 3071, height: 4096},
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, AUTO);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_STATIC_0100
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_STATIC_0100");
      const buffer = getBuffer("test.gif");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 99, height: 200},
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, SHARE_MEMORY);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_STATIC_0200
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_STATIC_0200");
      const buffer = getBuffer("test.gif");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 3071, height: 4096},
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_STATIC_0300
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_GIF_STATIC_0300");
      const buffer = getBuffer("test.gif");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 3071, height: 4096},
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, AUTO);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_SYNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_SYNC_STATIC_0100
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_SYNC_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_SYNC_STATIC_0100");
      const buffer = getBuffer("test.png");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 99, height: 200},
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, SHARE_MEMORY);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_SYNC_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_SYNC_STATIC_0200
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_SYNC_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_SYNC_STATIC_0200");
      const buffer = getBuffer("test.png");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 3071, height: 4096},
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_SYNC_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_SYNC_STATIC_0300
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_SYNC_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_SYNC_STATIC_0300");
      const buffer = getBuffer("test.png");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 3071, height: 4096},
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, AUTO);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_STATIC_0100
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_STATIC_0100");
      const buffer = getBuffer("test.png");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 99, height: 200},
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, SHARE_MEMORY);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_STATIC_0200
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_STATIC_0200");
      const buffer = getBuffer("test.png");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 3071, height: 4096},
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_STATIC_0300
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_PNG_STATIC_0300");
      const buffer = getBuffer("test.png");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 3071, height: 4096},
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, AUTO);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0100
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0100");
      const buffer = getBuffer(test_DMA_HDR);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 99, height: 200},
        desiredPixelFormat: RGBA_8888,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0200
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0200");
      const buffer = getBuffer(test_DMA_HDR);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 256, height: 256},
        desiredPixelFormat: BGRA_8888,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0300
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0300");
      const buffer = getBuffer(test_DMA_HDR);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 512, height: 512},
        desiredPixelFormat: BGRA_8888,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0400
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0400");
      const buffer = getBuffer(test_DMA_HDR);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 4001, height: 4096},
        desiredPixelFormat: RGBA_8888,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0500
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0500");
      const buffer = getBuffer(test_DMA_HDR);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 3072, height: 4096},
        desiredPixelFormat: RGBA_8888,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0600
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0600");
      const buffer = getBuffer(test_DMA_HDR);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 99, height: 200},
        desiredPixelFormat: RGBA_F16,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, AUTO);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0700
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0700");
      const buffer = getBuffer(test_DMA_HDR);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 256, height: 256},
        desiredPixelFormat: RGBA_8888,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, AUTO);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0800
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0800");
      const buffer = getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 512, height: 512},
        desiredPixelFormat: NV21,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, AUTO);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0900
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_0900");
      const buffer = getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 4001, height: 4096},
        desiredPixelFormat: NV12,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, AUTO);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1000
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1000");
      const buffer = getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 3072, height: 4096},
        desiredPixelFormat: RGBA_1010102,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, AUTO);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1100
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1100");
      const buffer = getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 99, height: 200},
        desiredPixelFormat: RGB_565,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, SHARE_MEMORY);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1200
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1200");
      const buffer = getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 256, height: 256},
        desiredPixelFormat: YCRCB_P010,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, SHARE_MEMORY);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1300
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1300");
      const buffer = getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 3071, height: 4096},
        desiredPixelFormat: YCRCB_P010,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, SHARE_MEMORY);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1301
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1301
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1301', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1301");
      const buffer = getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 3072, height: 4096},
        desiredPixelFormat: YCRCB_P010,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, SHARE_MEMORY);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1400
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1400");
      const buffer = getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 3071, height: 4096},
        desiredPixelFormat: YCRCB_P010,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1500
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1500
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1500");
      const buffer = getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 3072, height: 4096},
        desiredPixelFormat: YCRCB_P010,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1600
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1600
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1600");
      const buffer = getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 99, height: 200},
        desiredPixelFormat: YCRCB_P010,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1601
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1601
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1601', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1601");
      const buffer = getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 256, height: 256},
        desiredPixelFormat: YCRCB_P010,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1700
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1700
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1700");
      const buffer = getBuffer(test_DMA_33_77);
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default");
      let imageInfo = getImageInfo(logger, buffer);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1800
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1800
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1800");
      const buffer = getBuffer(test_DMA_128_256);
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default");
      let imageInfo = getImageInfo(logger, buffer);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1900
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1900
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_1900");
      const buffer = getBuffer(test_DMA_512_512);
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default");
      let imageInfo = getImageInfo(logger, buffer);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2000
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2000
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2000");
      const buffer = getBuffer(test_DMA_2999_3742);
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default");
      let imageInfo = getImageInfo(logger, buffer);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2100
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2100");
      const buffer = getBuffer(test_DMA_3072_4096);
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default");
      let imageInfo = getImageInfo(logger, buffer);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2200
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2200");
      const buffer = getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 99, height: 200},
        desiredPixelFormat: RGBA_8888,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2300
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2300");
      const buffer = getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 256, height: 256},
        desiredPixelFormat: BGRA_8888,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2400
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2400");
      const buffer = getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 512, height: 512},
        desiredPixelFormat: BGRA_8888,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2500
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2500
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2500");
      const buffer = getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 4001, height: 4096},
        desiredPixelFormat: RGBA_8888,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2600
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2600
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2600");
      const buffer = getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 3072, height: 4096},
        desiredPixelFormat: RGBA_8888,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2700
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2700
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2700");
      const buffer = getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 99, height: 200},
        desiredPixelFormat: RGBA_F16,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, AUTO);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2800
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2800
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2800");
      const buffer = getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 256, height: 256},
        desiredPixelFormat: RGBA_8888,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, AUTO);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2900
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2900
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_2900");
      const buffer = getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 512, height: 512},
        desiredPixelFormat: NV21,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, AUTO);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3000
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3000
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3000");
      const buffer = getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 4000, height: 4096},
        desiredPixelFormat: NV12,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, AUTO);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3100
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3100");
      const buffer = getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 3072, height: 4096},
        desiredPixelFormat: RGBA_1010102,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, AUTO);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3200
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3200");
      const buffer = getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 99, height: 200},
        desiredPixelFormat: YCRCB_P010,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, SHARE_MEMORY);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3300
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3300");
      const buffer = getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 256, height: 256},
        desiredPixelFormat: YCRCB_P010,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, SHARE_MEMORY);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3400
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3400");
      const buffer = getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 3071, height: 4096},
        desiredPixelFormat: YCRCB_P010,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, SHARE_MEMORY);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3401
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3401
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3401', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3401");
      const buffer = getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 3071, height: 4096},
        desiredPixelFormat: YCRCB_P010,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, SHARE_MEMORY);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3500
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3500
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3500");
      const buffer = getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 3071, height: 4096},
        desiredPixelFormat: YCRCB_P010,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3600
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3600
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3600");
      const buffer = getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 3072, height: 4096},
        desiredPixelFormat: YCRCB_P010,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3700
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3700
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3700");
      const buffer = getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 99, height: 200},
        desiredPixelFormat: YCRCB_P010,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3701
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3701
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3701', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3701");
      const buffer = getBuffer(test_DMA_1801_4041);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 256, height: 256},
        desiredPixelFormat: YCRCB_P010,
        desiredDynamicRange: RANGE_SDR
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3800
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3800
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3800");
      const buffer = getBuffer(test_DMA_33_77);
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync");
      let imageInfo = getImageInfo(logger, buffer);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3900
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3900
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_3900");
      const buffer = getBuffer(test_DMA_128_256);
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync");
      let imageInfo = getImageInfo(logger, buffer);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4000
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4000
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4000");
      const buffer = getBuffer(test_DMA_512_512);
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync");
      let imageInfo = getImageInfo(logger, buffer);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4100
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4100");
      const buffer = getBuffer(test_DMA_2999_3742);
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync");
      let imageInfo = getImageInfo(logger, buffer);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4200
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4200");
      const buffer = getBuffer(test_DMA_3072_4096);
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync");
      let imageInfo = getImageInfo(logger, buffer);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4300
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        const buffer = getBuffer(test_DMA_3071_4095);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 99, height: 200},
          desiredPixelFormat: YCRCB_P010,
          desiredDynamicRange: RANGE_HDR
        };
        let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions);
        let imageInfo = getImageInfo(logger, buffer, decodingOptions);
        let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4400
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        const buffer = getBuffer(test_DMA_3071_4095);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 4001, height: 4096},
          desiredPixelFormat: YCRCB_P010,
          desiredDynamicRange: RANGE_HDR
        };
        let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions);
        let imageInfo = getImageInfo(logger, buffer, decodingOptions);
        let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4500
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4500
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        const buffer = getBuffer(test_DMA_3071_4095);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 99, height: 200},
          desiredPixelFormat: YCRCB_P010,
          desiredDynamicRange: RANGE_HDR
        };
        let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, AUTO);
        let imageInfo = getImageInfo(logger, buffer, decodingOptions);
        let ret = checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4600
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4600
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4600");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        const buffer = getBuffer(test_DMA_3071_4095);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 4001, height: 4096},
          desiredPixelFormat: YCRCB_P010,
          desiredDynamicRange: RANGE_HDR
        };
        let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, AUTO);
        let imageInfo = getImageInfo(logger, buffer, decodingOptions);
        let ret = checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4700
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4700
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4700");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        const buffer = getBuffer(test_DMA_3071_4095);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 99, height: 200},
          desiredPixelFormat: YCRCB_P010,
          desiredDynamicRange: RANGE_HDR
        };
        let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
        let imageInfo = getImageInfo(logger, buffer, decodingOptions);
        let ret = checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4800
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4800
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4800");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        const buffer = getBuffer(test_DMA_3071_4095);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 3071, height: 4096},
          desiredPixelFormat: YCRCB_P010,
          desiredDynamicRange: RANGE_HDR
        };
        let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
        let imageInfo = getImageInfo(logger, buffer, decodingOptions);
        let ret = checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4900
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4900
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4900");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        const buffer = getBuffer(test_DMA_55_77);
        let pixelMap = getPixelmapFromAllocator(logger, buffer, "default");
        let imageInfo = getImageInfo(logger, buffer);
        let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4901
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4901
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4901', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_STATIC_4901");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        const buffer = getBuffer(test_DMA_3071_4095);
        let pixelMap = getPixelmapFromAllocator(logger, buffer, "default");
        let imageInfo = getImageInfo(logger, buffer);
        let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_STATIC_5000
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_STATIC_5000
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_STATIC_5000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_STATIC_5000");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        const buffer = getBuffer(test_DMA_3071_4095);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 99, height: 200},
          desiredPixelFormat: YCRCB_P010,
          desiredDynamicRange: RANGE_HDR
        };
        let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions);
        let imageInfo = getImageInfo(logger, buffer, decodingOptions);
        let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_STATIC_5100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_STATIC_5100
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_STATIC_5100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_STATIC_5100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        const buffer = getBuffer(test_DMA_3071_4095);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 4001, height: 4096},
          desiredPixelFormat: YCRCB_P010,
          desiredDynamicRange: RANGE_HDR
        };
        let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions);
        let imageInfo = getImageInfo(logger, buffer, decodingOptions);
        let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_STATIC_5200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_STATIC_5200
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_STATIC_5200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_STATIC_5200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        const buffer = getBuffer(test_DMA_3071_4095);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 99, height: 200},
          desiredPixelFormat: YCRCB_P010,
          desiredDynamicRange: RANGE_HDR
        };
        let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, AUTO);
        let imageInfo = getImageInfo(logger, buffer, decodingOptions);
        let ret = checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_STATIC_5300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_STATIC_5300
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_STATIC_5300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_STATIC_5300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        const buffer = getBuffer(test_DMA_3071_4095);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 4001, height: 4096},
          desiredPixelFormat: YCRCB_P010,
          desiredDynamicRange: RANGE_HDR
        };
        let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, AUTO);
        let imageInfo = getImageInfo(logger, buffer, decodingOptions);
        let ret = checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_STATIC_5400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_STATIC_5400
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_STATIC_5400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_STATIC_5400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        const buffer = getBuffer(test_DMA_3071_4095);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 99, height: 200},
          desiredPixelFormat: YCRCB_P010,
          desiredDynamicRange: RANGE_HDR
        };
        let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
        let imageInfo = getImageInfo(logger, buffer, decodingOptions);
        let ret = checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_STATIC_5500
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_STATIC_5500
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_STATIC_5500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_STATIC_5500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        const buffer = getBuffer(test_DMA_3071_4095);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 3071, height: 4096},
          desiredPixelFormat: YCRCB_P010,
          desiredDynamicRange: RANGE_HDR
        };
        let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
        let imageInfo = getImageInfo(logger, buffer, decodingOptions);
        let ret = checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_STATIC_5600
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_STATIC_5600
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_STATIC_5600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_STATIC_5600");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        const buffer = getBuffer(test_DMA_55_77);
        let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync");
        let imageInfo = getImageInfo(logger, buffer);
        let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_STATIC_5700
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_STATIC_5700
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_STATIC_5700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_JPEG_STATIC_5700");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        const buffer = getBuffer(test_DMA_3071_4095);
        let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync");
        let imageInfo = getImageInfo(logger, buffer);
        let ret = checkPixelmap(done, logger, pixelMap, imageInfo);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_STATIC_0100
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_STATIC_0100");
      const buffer = getBuffer("test.bmp");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 99, height: 200},
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, SHARE_MEMORY);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_STATIC_0200
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_STATIC_0200");
      const buffer = getBuffer("test.bmp");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 3071, height: 4096},
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_STATIC_0300
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_STATIC_0300");
      const buffer = getBuffer("test.bmp");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 3071, height: 4096},
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, AUTO);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_STATIC_0100
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_STATIC_0100");
      const buffer = getBuffer("test.webp");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 99, height: 200},
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, SHARE_MEMORY);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_STATIC_0200
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_STATIC_0200");
      const buffer = getBuffer("test.webp");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 3071, height: 4096},
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_STATIC_0300
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_STATIC_0300");
      const buffer = getBuffer("test.webp");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 3071, height: 4096},
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, AUTO);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_STATIC_0100
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_STATIC_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        const buffer = getBuffer("test_dng.dng");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 99, height: 200},
          desiredPixelFormat: YCRCB_P010
        };
        let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, SHARE_MEMORY);
        let imageInfo = getImageInfo(logger, buffer, decodingOptions);
        let ret = checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_STATIC_0200
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_STATIC_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        const buffer = getBuffer("test_dng.dng");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 3071, height: 4096},
          desiredPixelFormat: YCRCB_P010
        };
        let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
        let imageInfo = getImageInfo(logger, buffer, decodingOptions);
        let ret = checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_STATIC_0300
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_STATIC_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        const buffer = getBuffer("test_dng.dng");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 3071, height: 4096},
          desiredPixelFormat: YCRCB_P010
        };
        let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, AUTO);
        let imageInfo = getImageInfo(logger, buffer, decodingOptions);
        let ret = checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_STATIC_0100
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_STATIC_0100");
      const buffer = getBuffer("test.ico");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 99, height: 200},
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, SHARE_MEMORY);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_STATIC_0200
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_STATIC_0200");
      const buffer = getBuffer("test.ico");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 3071, height: 4096},
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_STATIC_0300
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_STATIC_0300");
      const buffer = getBuffer("test.ico");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 3071, height: 4096},
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, AUTO);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_STATIC_0100
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_STATIC_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        const buffer = getBuffer("0801_sdr2.heic");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 99, height: 200},
          desiredPixelFormat: YCRCB_P010
        };
        let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, SHARE_MEMORY);
        let imageInfo = getImageInfo(logger, buffer, decodingOptions);
        let ret = checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_STATIC_0200
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_STATIC_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        const buffer = getBuffer("0801_sdr2.heic");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 3071, height: 4096},
          desiredPixelFormat: YCRCB_P010
        };
        let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, DMA);
        let imageInfo = getImageInfo(logger, buffer, decodingOptions);
        let ret = checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_STATIC_0300
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_STATIC_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        const buffer = getBuffer("0801_sdr2.heic");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 3071, height: 4096},
          desiredPixelFormat: YCRCB_P010
        };
        let pixelMap = getPixelmapFromAllocator(logger, buffer, "default", decodingOptions, AUTO);
        let imageInfo = getImageInfo(logger, buffer, decodingOptions);
        let ret = checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_SYNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_SYNC_STATIC_0100
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_SYNC_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_SYNC_STATIC_0100");
      const buffer = getBuffer("test.bmp");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 99, height: 200},
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, SHARE_MEMORY);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_SYNC_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_SYNC_STATIC_0200
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_SYNC_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_SYNC_STATIC_0200");
      const buffer = getBuffer("test.bmp");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 3071, height: 4096},
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_SYNC_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_SYNC_STATIC_0300
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_SYNC_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_BMP_SYNC_STATIC_0300");
      const buffer = getBuffer("test.bmp");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 3071, height: 4096},
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, AUTO);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_SYNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_SYNC_STATIC_0100
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_SYNC_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_SYNC_STATIC_0100");
      const buffer = getBuffer("test.webp");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 99, height: 200},
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, SHARE_MEMORY);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_SYNC_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_SYNC_STATIC_0200
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_SYNC_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_SYNC_STATIC_0200");
      const buffer = getBuffer("test.webp");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 3071, height: 4096},
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_SYNC_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_SYNC_STATIC_0300
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_SYNC_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WEBP_SYNC_STATIC_0300");
      const buffer = getBuffer("test.webp");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 3071, height: 4096},
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, AUTO);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_SYNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_SYNC_STATIC_0100
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_SYNC_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_SYNC_STATIC_0100");
      const buffer = getBuffer("test.ico");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 99, height: 200},
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, SHARE_MEMORY);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_SYNC_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_SYNC_STATIC_0200
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_SYNC_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_SYNC_STATIC_0200");
      const buffer = getBuffer("test.ico");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 3071, height: 4096},
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_SYNC_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_SYNC_STATIC_0300
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_SYNC_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_ICO_SYNC_STATIC_0300");
      const buffer = getBuffer("test.ico");
      let decodingOptions: image.DecodingOptions = {
        desiredSize: {width: 3071, height: 4096},
        desiredPixelFormat: YCRCB_P010
      };
      let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, AUTO);
      let imageInfo = getImageInfo(logger, buffer, decodingOptions);
      let ret = checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
      logger.log("checkPixelmap result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_SYNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_SYNC_STATIC_0100
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_SYNC_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_SYNC_STATIC_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        const buffer = getBuffer("test_dng.dng");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 99, height: 200},
          desiredPixelFormat: YCRCB_P010
        };
        let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, SHARE_MEMORY);
        let imageInfo = getImageInfo(logger, buffer, decodingOptions);
        let ret = checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_SYNC_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_SYNC_STATIC_0200
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_SYNC_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_SYNC_STATIC_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        const buffer = getBuffer("test_dng.dng");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 3071, height: 4096},
          desiredPixelFormat: YCRCB_P010
        };
        let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
        let imageInfo = getImageInfo(logger, buffer, decodingOptions);
        let ret = checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_SYNC_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_SYNC_STATIC_0300
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_SYNC_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DNG_SYNC_STATIC_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        const buffer = getBuffer("test_dng.dng");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 3071, height: 4096},
          desiredPixelFormat: YCRCB_P010
        };
        let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, AUTO);
        let imageInfo = getImageInfo(logger, buffer, decodingOptions);
        let ret = checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_SYNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_SYNC_STATIC_0100
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_SYNC_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_SYNC_STATIC_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
       const buffer = getBuffer("0801_sdr2.heic");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 99, height: 200},
          desiredPixelFormat: YCRCB_P010
        };
        let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, SHARE_MEMORY);
        let imageInfo = getImageInfo(logger, buffer, decodingOptions);
        let ret = checkPixelmap(done, logger, pixelMap, imageInfo, SHARE_MEMORY);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_SYNC_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_SYNC_STATIC_0200
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_SYNC_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_SYNC_STATIC_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        const buffer = getBuffer("0801_sdr2.heic");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 3071, height: 4096},
          desiredPixelFormat: YCRCB_P010
        };
        let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, DMA);
        let imageInfo = getImageInfo(logger, buffer, decodingOptions);
        let ret = checkPixelmap(done, logger, pixelMap, imageInfo, DMA);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_SYNC_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_SYNC_STATIC_0300
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_SYNC_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_HEIF_SYNC_STATIC_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        const buffer = getBuffer("0801_sdr2.heic");
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: 3071, height: 4096},
          desiredPixelFormat: YCRCB_P010
        };
        let pixelMap = getPixelmapFromAllocator(logger, buffer, "sync", decodingOptions, AUTO);
        let imageInfo = getImageInfo(logger, buffer, decodingOptions);
        let ret = checkPixelmap(done, logger, pixelMap, imageInfo, AUTO);
        logger.log("checkPixelmap result is: " + ret);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_STATIC_0700
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_STATIC_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_STATIC_0700");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        try {
          const buffer = getBuffer(test_DMA_3071_4095);``
          let decodingOptions: image.DecodingOptions = {
            desiredSize: {width: 99, height: 200},
            desiredPixelFormat: YCRCB_P010,
            desiredDynamicRange: RANGE_HDR
          };
          let imageSource = image.createImageSource(buffer);
          expect(imageSource != undefined).assertTrue();
          let pixelMap = await imageSource!.createPixelMapUsingAllocator(decodingOptions, SHARE_MEMORY);
          expect(false).assertTrue();
          if(pixelMap != undefined) {
            await pixelMap!.release();
          }
          done();
        } catch (error) {
        error = error as BusinessError;
          logger.log("createPixelMapUsingAllocator is error: " + JSON.stringify(error));
          expect(error.code == UNSUPPORTED_ALLOCATOR_TYPE).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_STATIC_0800
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_STATIC_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_STATIC_0800");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        try {
          const buffer = getBuffer(test_DMA_3071_4095);
          let decodingOptions: image.DecodingOptions = {
            desiredSize: {width: 3071, height: 4096},
            desiredPixelFormat: YCRCB_P010,
            desiredDynamicRange: RANGE_HDR
          };
          let imageSource = image.createImageSource(buffer);
          expect(imageSource != undefined).assertTrue();
          let pixelMap = imageSource!.createPixelMapUsingAllocatorSync(decodingOptions, SHARE_MEMORY);
          expect(false).assertTrue();
          if(pixelMap != undefined) {
            await pixelMap.release();
          }
          done();
        } catch (error) {
          error = error as BusinessError;
          logger.log("createPixelMapUsingAllocator is error: " + JSON.stringify(error));
          expect(error.code == UNSUPPORTED_ALLOCATOR_TYPE).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_STATIC_0900
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_STATIC_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_STATIC_0900");
      try {
        const buffer = getBuffer("SIZE_0_0.jpg");
        let imageSource = image.createImageSource(buffer);
        expect(imageSource != undefined).assertTrue();
        let pixelMap = await imageSource!.createPixelMapUsingAllocator();
        expect(false).assertTrue();
        done();
      } catch (error) {
        error = error as BusinessError;
        logger.log("createPixelMapUsingAllocator is error: " + JSON.stringify(error));
        expect(error.code == DECODE_FAILED).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_STATIC_1000
     * @tc.desc   test Image createPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_STATIC_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_JPEG_ERROR_STATIC_1000");
      try {
        const buffer = getBuffer("SIZE_0_0.jpg");
        let imageSource = image.createImageSource(buffer);
        expect(imageSource != undefined).assertTrue();
        let pixelMap = imageSource!.createPixelMapUsingAllocatorSync();
        expect(false).assertTrue();
        done();
      } catch (error) {
        error = error as BusinessError;
        logger.log("createPixelMapUsingAllocatorSync is error: " + JSON.stringify(error));
        expect(error.code == DECODE_FAILED).assertTrue();
        done();
      }
    })
  })
}

