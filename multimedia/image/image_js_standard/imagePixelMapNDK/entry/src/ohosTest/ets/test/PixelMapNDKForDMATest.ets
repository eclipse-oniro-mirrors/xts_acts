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

import { describe, beforeAll, afterEach, it, expect, TestType, Level, Size } from '@ohos/hypium';
import ndkTest from 'libPixelMapNdk.so';
import image from "@ohos.multimedia.image";
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import hilog from '@ohos.hilog';
import display from '@ohos.display';
import hdrCapability from '@ohos.graphics.hdrCapability';
import taskpool from '@ohos.taskpool';

const domain = 0x0000;
const testTag = 'PixelmapNdkTest';
const twoParametersFile = "test_DMA_1801_4041.jpg";
const test_DMA_3071_4095 = "test_DMA_3071_4095.jpg";
const test_wbmp = "test.wbmp";
const PARAMETER_ERROR = 401;
const UNSUPPORTED_ALLOCATOR_TYPE = 7700201;
const DECODE_FAILED = 7700301;
const AUTO = image.AllocatorType.AUTO;
const DMA = image.AllocatorType.DMA;
const SHARE_MEMORY = image.AllocatorType.SHARE_MEMORY;
const RANGE_SDR = image.DecodingDynamicRange.SDR;
const RANGE_HDR = image.DecodingDynamicRange.HDR;
const RGB_565 = image.PixelMapFormat.RGB_565;
const RGBA_8888 = image.PixelMapFormat.RGBA_8888;
const BGRA_8888 = image.PixelMapFormat.BGRA_8888;
const RGB_888 = image.PixelMapFormat.RGB_888;
const ALPHA_8 = image.PixelMapFormat.ALPHA_8;
const RGBA_F16 = image.PixelMapFormat.RGBA_F16;
const NV21 = image.PixelMapFormat.NV21;
const NV12 = image.PixelMapFormat.NV12;
const RGBA_1010102 = image.PixelMapFormat.RGBA_1010102;
const YCBCR_P010 = image.PixelMapFormat.YCBCR_P010;
const YCRCB_P010 = image.PixelMapFormat.YCRCB_P010;

const SCALE_FIRST = image.CropAndScaleStrategy.SCALE_FIRST;
const CROP_FIRST = image.CropAndScaleStrategy.CROP_FIRST;
let isSupportHdr: boolean = false;
let isSupportHEIFDecode: boolean = false;
let testContext: common.UIAbilityContext;
let filesDir: string|undefined;
let cacheDir: string|undefined;

class Logger {
  testNum: string;

  constructor(testNum: string) {
    this.testNum = testNum;
  }

  log(msg: string) {
    hilog.info(0x0000, "imagePixelmapNdk", 'case: %{public}s msg:%{public}s', this.testNum, msg);
  }
}

async function decodeTiffTestInTaskPool(
  logger: Logger,
  filePath: string,
  desiredInfo: ndkTest.decodeOptions,
  allocatorType: image.AllocatorType = AUTO
): Promise<boolean> {
  logger.log("taskpool start");
  try {
      let task = new taskpool.Task(testDecodeTiff, filePath, desiredInfo, allocatorType);
      let ret = (await taskpool.execute(task)) as boolean;
      logger.log("taskpool ret: " + ret);
      return ret;
  } catch (error) {
      logger.log("taskpool: taskpool execute error is " + error);
      return false;
  }
}

@Concurrent
function testDecodeTiff(
  filePath: string,
  desiredInfo: ndkTest.decodeOptions,
  allocatorType: image.AllocatorType = AUTO
): boolean {
  let imageInfo = ndkTest.CreatePixelMapForDMAAndGetInfo(filePath, allocatorType, desiredInfo);
  if (typeof imageInfo == 'object') {
      let expectedWidth = desiredInfo.width;
      let expectedHeight = desiredInfo.height;
      let expectedPixelFormat = desiredInfo.pixelFormat;
      if (desiredInfo.cropAndScaleStrategy == image.CropAndScaleStrategy.SCALE_FIRST && desiredInfo.desiredRegion) {
        expectedWidth = desiredInfo.desiredRegion.width;
        expectedHeight = desiredInfo.desiredRegion.height;
        expectedPixelFormat = image.PixelMapFormat.RGBA_8888; // SCALE_FIRST模式下，像素格式为RGBA_8888
      }
      let ret = (imageInfo.width == expectedWidth) &&
                (imageInfo.height == expectedHeight) &&
                (imageInfo.pixelFormat == expectedPixelFormat) &&
                (imageInfo.mimeType == desiredInfo.mimeType);
      console.log("testDecodeTiff expected result = " + JSON.stringify(desiredInfo));
      console.log("testDecodeTiff CreatePixelMapForDMAAndGetInfo result = " + JSON.stringify(imageInfo));
      return ret;
  } else {
      console.log("testDecodeTiff CreatePixelMapForDMAAndGetInfo result is not object!");
      return false;
  }
}

export default function pixelmapNdkForDMATest() {
  describe('pixelMapNdkForDMATest', () => {
    let isSupportTiff: Boolean;
    beforeAll(() => {
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      filesDir = AppStorage.get('pathDir');
      cacheDir = AppStorage.get('cacheDir');
      isSupportHdr = !display.getDefaultDisplaySync().hdrFormats.includes(hdrCapability.HDRFormat.NONE) &&
        display.getDefaultDisplaySync().hdrFormats.length != 0;
      isSupportHEIFDecode =
        image.createImageSource(filesDir + '/' + "test.jpg").supportedFormats.includes("image/heic");
      isSupportTiff =
        image.getImageSourceSupportedFormats().includes("image/tiff");
    })

    const getBuffer = (filePath: string) => {
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize);
      fs.readSync(file.fd, bufferRead);
      fs.closeSync(file.fd);
      return bufferRead;
    }

    const getImageInfoFromPixelmapJS = async (
      logger: Logger,
      buffer: ArrayBuffer,
      size: image.Size,
      pixelFormat: image.PixelMapFormat,
      desiredDynamicRange?: image.DecodingDynamicRange
    ) => {
      let imageSource = image.createImageSource(buffer);
      let pixelMap: image.PixelMap;
      if (desiredDynamicRange != undefined) {
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: size.width, height: size.height},
          desiredPixelFormat: pixelFormat,
          desiredDynamicRange: desiredDynamicRange
        };
        pixelMap = await imageSource.createPixelMap(decodingOptions);
      } else {
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {width: size.width, height: size.height},
          desiredPixelFormat: pixelFormat
        };
        pixelMap = await imageSource.createPixelMap(decodingOptions);
      }
      let imageInfo = await pixelMap.getImageInfo();
      logger.log("getImageInfoFromPixelmapJS info is: " + JSON.stringify(imageInfo));
      await imageSource?.release();
      await pixelMap?.release();
      return imageInfo;
    }

    const getPixelmap = (
      logger: Logger,
      path: string,
      allocatorType: image.AllocatorType,
      size: image.Size,
      pixelMapFormat: image.PixelMapFormat,
      desiredDynamicRange?: image.DecodingDynamicRange
    ) => {
      let result: number;
      if (desiredDynamicRange != undefined) {
        result = ndkTest.CreatePixelMapUsingAllocator(path, allocatorType, size, pixelMapFormat, desiredDynamicRange);
      } else{
        result = ndkTest.CreatePixelMapUsingAllocator(path, allocatorType, size, pixelMapFormat);
      }
      if (result == undefined) {
        logger.log('Failed to create pixelMap. error is: ' + result);
      }
      return result;
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
        case RGB_888:
          fromatBytes = 3;
        case ALPHA_8:
          fromatBytes = 1;
          break;
        case RGBA_F16:
          fromatBytes = 8;
          break;
      }
      return fromatBytes;
    }

    const testPixelmap = async (
      logger: Logger,
      originImageInfo: image.ImageInfo,
      allocatorType: image.AllocatorType = AUTO
    ): Promise<boolean> => {
      let ret = false;
      const dstImageInfo: ndkTest.imageInfo = ndkTest.GetPixelmapInfo();
      logger.log("originImageInfo is:" + JSON.stringify(originImageInfo));
      logger.log("dstImageInfo is:" + JSON.stringify(dstImageInfo));
      ret = (dstImageInfo!= undefined) &&
            (dstImageInfo.height == originImageInfo.size.height) &&
            (dstImageInfo.width  == originImageInfo.size.width);
      if (allocatorType != AUTO) {
        let fromatBytes = getPixelMapFormatBytes(originImageInfo.pixelFormat);
        ret = ret && (dstImageInfo.stride >= (originImageInfo.size.width * fromatBytes));
      }
      logger.log("compare imageInfo result is: " + ret);
      return ret;
    }

    const DecodeWbmpImageTest = (
      logger: Logger,
      fileName: string,
      expectInfo: ndkTest.decodeOptions,
      allocatorType: image.AllocatorType = AUTO
    ): boolean => {
      let filePath = filesDir + "/" + fileName;
      let imageInfo: ndkTest.decodeOptions | number;
      logger.log("filePath is: " + filePath);
      imageInfo = ndkTest.CreatePixelMapForDMAAndGetInfo(filePath, allocatorType, expectInfo);
      if (typeof imageInfo == 'object') {
        let ret = (imageInfo.width == expectInfo.width) &&
                  (imageInfo.height == expectInfo.height) &&
                  (imageInfo.mimeType == expectInfo.mimeType);
        logger.log("check result is: " + ret);
        logger.log("expect info: " + JSON.stringify(expectInfo));
        logger.log("Actual info: " + JSON.stringify(imageInfo));
        return ret;
      } else {
        logger.log("CreatePixelMapForDMAAndGetInfo result is not object!");
        return false;
      }
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0100");
      let path = filesDir + "/" + twoParametersFile;
      const buffer = getBuffer(path);
      let size: image.Size = {width: 99, height: 200};
      let result = getPixelmap(logger, path, AUTO, size, RGBA_F16, RANGE_SDR);
      let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, RGBA_F16, RANGE_SDR);
      let ret = await testPixelmap(logger, originImageInfo, AUTO);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0200");
      let path = filesDir + "/" + twoParametersFile;
      const buffer = getBuffer(path);
      let size: image.Size = {width: 256, height: 256};
      let result = getPixelmap(logger, path, AUTO, size, BGRA_8888, RANGE_SDR);
      let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, BGRA_8888, RANGE_SDR);
      let ret = await testPixelmap(logger, originImageInfo, AUTO);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0400
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0400");
      let path = filesDir + "/" + twoParametersFile;
      const buffer = getBuffer(path);
      let size: image.Size = {width: 512, height: 512};
      let result = getPixelmap(logger, path, AUTO, size, NV21, RANGE_SDR);
      let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, NV21, RANGE_SDR);
      let ret = await testPixelmap(logger, originImageInfo, AUTO);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0500
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0500");
      let path = filesDir + "/" + twoParametersFile;
      const buffer = getBuffer(path);
      let size: image.Size = {width: 4000, height: 4096};
      let result = getPixelmap(logger, path, AUTO, size, NV12, RANGE_SDR);
      let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, NV12, RANGE_SDR);
      let ret = await testPixelmap(logger, originImageInfo, AUTO);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0600
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0600");
      let path = filesDir + "/" + twoParametersFile;
      const buffer = getBuffer(path);
      let size: image.Size = {width: 3072, height: 4096};
      let result = getPixelmap(logger, path, AUTO, size, RGBA_1010102, RANGE_SDR);
      let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, RGBA_1010102, RANGE_SDR);
      let ret = await testPixelmap(logger, originImageInfo, AUTO);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0700
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0700");
      let path = filesDir + "/" + twoParametersFile;
      const buffer = getBuffer(path);
      let size: image.Size = {width: 99, height: 200};
      let result = getPixelmap(logger, path, SHARE_MEMORY, size, YCRCB_P010, RANGE_SDR);
      let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010, RANGE_SDR);
      let ret = await testPixelmap(logger, originImageInfo, SHARE_MEMORY);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0800
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0800");
      let path = filesDir + "/" + twoParametersFile;
      const buffer = getBuffer(path);
      let size: image.Size = {width: 256, height: 256};
      let result = getPixelmap(logger, path, SHARE_MEMORY, size, YCRCB_P010, RANGE_SDR);
      let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010, RANGE_SDR);
      let ret = await testPixelmap(logger, originImageInfo, SHARE_MEMORY);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0900
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0900");
      let path = filesDir + "/" + twoParametersFile;
      const buffer = getBuffer(path);
      let size: image.Size = {width: 3071, height: 4096};
      let result = getPixelmap(logger, path, SHARE_MEMORY, size, YCRCB_P010, RANGE_SDR);
      let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010, RANGE_SDR);
      let ret = await testPixelmap(logger, originImageInfo, SHARE_MEMORY);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0901
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0901
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0901', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0901");
      let path = filesDir + "/" + twoParametersFile;
      const buffer = getBuffer(path);
      let size: image.Size = {width: 3072, height: 4096};
      let result = getPixelmap(logger, path, SHARE_MEMORY, size, YCRCB_P010, RANGE_SDR);
      let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010, RANGE_SDR);
      let ret = await testPixelmap(logger, originImageInfo, SHARE_MEMORY);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1000
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1000");
      let path = filesDir + "/" + twoParametersFile;
      const buffer = getBuffer(path);
      let size: image.Size = {width: 3071, height: 4096};
      let result = getPixelmap(logger, path, DMA, size, YCRCB_P010, RANGE_SDR);
      let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010, RANGE_SDR);
      let ret = await testPixelmap(logger, originImageInfo, DMA);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1100");
      let path = filesDir + "/" + twoParametersFile;
      const buffer = getBuffer(path);
      let size: image.Size = {width: 3072, height: 4096};
      let result = getPixelmap(logger, path, DMA, size, YCRCB_P010, RANGE_SDR);
      let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010, RANGE_SDR);
      let ret = await testPixelmap(logger, originImageInfo, DMA);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1101
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1101
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1101");
      let path = filesDir + "/" + twoParametersFile;
      const buffer = getBuffer(path);
      let size: image.Size = {width: 99, height: 200};
      let result = getPixelmap(logger, path, DMA, size, YCRCB_P010, RANGE_SDR);
      let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010, RANGE_SDR);
      let ret = await testPixelmap(logger, originImageInfo, DMA);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1102
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1102
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1102");
      let path = filesDir + "/" + twoParametersFile;
      const buffer = getBuffer(path);
      let size: image.Size = {width: 256, height: 256};
      let result = getPixelmap(logger, path, DMA, size, YCRCB_P010, RANGE_SDR);
      let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010, RANGE_SDR);
      let ret = await testPixelmap(logger, originImageInfo, DMA);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let path = filesDir + "/" + test_DMA_3071_4095;
        const buffer = getBuffer(path);
        let size: image.Size = {width: 99, height: 200};
        let result = getPixelmap(logger, path, AUTO, size, YCRCB_P010, RANGE_HDR);
        let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010, RANGE_HDR);
        let ret = await testPixelmap(logger, originImageInfo, AUTO);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let path = filesDir + "/" + test_DMA_3071_4095;
        const buffer = getBuffer(path);
        let size: image.Size = {width: 4001, height: 4096};
        let result = getPixelmap(logger, path, AUTO, size, YCRCB_P010, RANGE_HDR);
        let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010, RANGE_HDR);
        let ret = await testPixelmap(logger, originImageInfo, AUTO);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1400
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let path = filesDir + "/" + test_DMA_3071_4095;
        const buffer = getBuffer(path);
        let size: image.Size = {width: 99, height: 200};
        let result = getPixelmap(logger, path, DMA, size, YCRCB_P010, RANGE_HDR);
        let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010, RANGE_HDR);
        let ret = await testPixelmap(logger, originImageInfo, DMA);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1500
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let path = filesDir + "/" + test_DMA_3071_4095;
        const buffer = getBuffer(path);
        let size: image.Size = {width: 3071, height: 4096};
        let result = getPixelmap(logger, path, DMA, size, YCRCB_P010, RANGE_HDR);
        let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010, RANGE_HDR);
        let ret = await testPixelmap(logger, originImageInfo, DMA);
        expect(ret).assertTrue();
        done();
      }
    })

    /**覆盖格式 */
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_PNG_NATIVE_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_PNG_NATIVE_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_PNG_NATIVE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_PNG_NATIVE_0100");
      let path = filesDir + "/test.png";
      const buffer = getBuffer(path);
      let size: image.Size = {width: 99, height: 200};
      let result = getPixelmap(logger, path, SHARE_MEMORY, size, YCRCB_P010);
      let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010);
      let ret = await testPixelmap(logger, originImageInfo, SHARE_MEMORY);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_PNG_NATIVE_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_PNG_NATIVE_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_PNG_NATIVE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_PNG_NATIVE_0200");
      let path = filesDir + "/test.png";
      const buffer = getBuffer(path);
      let size: image.Size = {width: 3071, height: 4096};
      let result = getPixelmap(logger, path, DMA, size, YCRCB_P010);
      let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010);
      let ret = await testPixelmap(logger, originImageInfo, DMA);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_PNG_NATIVE_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_PNG_NATIVE_0300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_PNG_NATIVE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_PNG_NATIVE_0300");
      let path = filesDir + "/test.png";
      const buffer = getBuffer(path);
      let size: image.Size = {width: 3071, height: 4096};
      let result = getPixelmap(logger, path, AUTO, size, YCRCB_P010);
      let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010);
      let ret = await testPixelmap(logger, originImageInfo, AUTO);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_GIF_NATIVE_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_GIF_NATIVE_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_GIF_NATIVE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_GIF_NATIVE_0100");
      let path = filesDir + "/test.gif";
      const buffer = getBuffer(path);
      let size: image.Size = {width: 99, height: 200};
      let result = getPixelmap(logger, path, SHARE_MEMORY, size, YCRCB_P010);
      let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010);
      let ret = await testPixelmap(logger, originImageInfo, SHARE_MEMORY);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_GIF_NATIVE_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_GIF_NATIVE_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_GIF_NATIVE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_GIF_NATIVE_0200");
      let path = filesDir + "/test.gif";
      const buffer = getBuffer(path);
      let size: image.Size = {width: 3071, height: 4096};
      let result = getPixelmap(logger, path, DMA, size, YCRCB_P010);
      let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010);
      let ret = await testPixelmap(logger, originImageInfo, DMA);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_GIF_NATIVE_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_GIF_NATIVE_0300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_GIF_NATIVE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_GIF_NATIVE_0300");
      let path = filesDir + "/test.gif";
      const buffer = getBuffer(path);
      let size: image.Size = {width: 3071, height: 4096};
      let result = getPixelmap(logger, path, AUTO, size, YCRCB_P010);
      let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010);
      let ret = await testPixelmap(logger, originImageInfo, AUTO);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_ICO_NATIVE_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_ICO_NATIVE_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_ICO_NATIVE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_ICO_NATIVE_0100");
      let path = filesDir + "/test.ico";
      const buffer = getBuffer(path);
      let size: image.Size = {width: 99, height: 200};
      let result = getPixelmap(logger, path, SHARE_MEMORY, size, YCRCB_P010);
      let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010);
      let ret = await testPixelmap(logger, originImageInfo, SHARE_MEMORY);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_ICO_NATIVE_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_ICO_NATIVE_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_ICO_NATIVE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_ICO_NATIVE_0200");
      let path = filesDir + "/test.ico";
      const buffer = getBuffer(path);
      let size: image.Size = {width: 3071, height: 4096};
      let result = getPixelmap(logger, path, DMA, size, YCRCB_P010);
      let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010);
      let ret = await testPixelmap(logger, originImageInfo, DMA);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_ICO_NATIVE_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_ICO_NATIVE_0300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_ICO_NATIVE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_ICO_NATIVE_0300");
      let path = filesDir + "/test.ico";
      const buffer = getBuffer(path);
      let size: image.Size = {width: 3071, height: 4096};
      let result = getPixelmap(logger, path, AUTO, size, YCRCB_P010);
      let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010);
      let ret = await testPixelmap(logger, originImageInfo, AUTO);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_BMP_NATIVE_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_BMP_NATIVE_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_BMP_NATIVE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_BMP_NATIVE_0100");
      let path = filesDir + "/test.bmp";
      const buffer = getBuffer(path);
      let size: image.Size = {width: 99, height: 200};
      let result = getPixelmap(logger, path, SHARE_MEMORY, size, YCRCB_P010);
      let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010);
      let ret = await testPixelmap(logger, originImageInfo, SHARE_MEMORY);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_BMP_NATIVE_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_BMP_NATIVE_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_BMP_NATIVE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_BMP_NATIVE_0200");
      let path = filesDir + "/test.bmp";
      const buffer = getBuffer(path);
      let size: image.Size = {width: 3071, height: 4096};
      let result = getPixelmap(logger, path, DMA, size, YCRCB_P010);
      let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010);
      let ret = await testPixelmap(logger, originImageInfo, DMA);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_BMP_NATIVE_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_BMP_NATIVE_0300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_BMP_NATIVE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_BMP_NATIVE_0300");
      let path = filesDir + "/test.bmp";
      const buffer = getBuffer(path);
      let size: image.Size = {width: 3071, height: 4096};
      let result = getPixelmap(logger, path, AUTO, size, YCRCB_P010);
      let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010);
      let ret = await testPixelmap(logger, originImageInfo, AUTO);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_WEBP_NATIVE_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_WEBP_NATIVE_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_WEBP_NATIVE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_WEBP_NATIVE_0100");
      let path = filesDir + "/test.webp";
      const buffer = getBuffer(path);
      let size: image.Size = {width: 99, height: 200};
      let result = getPixelmap(logger, path, SHARE_MEMORY, size, YCRCB_P010);
      let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010);
      let ret = await testPixelmap(logger, originImageInfo, SHARE_MEMORY);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_WEBP_NATIVE_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_WEBP_NATIVE_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_WEBP_NATIVE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_WEBP_NATIVE_0200");
      let path = filesDir + "/test.webp";
      const buffer = getBuffer(path);
      let size: image.Size = {width: 3071, height: 4096};
      let result = getPixelmap(logger, path, DMA, size, YCRCB_P010);
      let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010);
      let ret = await testPixelmap(logger, originImageInfo, DMA);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_WEBP_NATIVE_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_WEBP_NATIVE_0300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_WEBP_NATIVE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_WEBP_NATIVE_0300");
      let path = filesDir + "/test.webp";
      const buffer = getBuffer(path);
      let size: image.Size = {width: 3071, height: 4096};
      let result = getPixelmap(logger, path, AUTO, size, YCRCB_P010);
      let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010);
      let ret = await testPixelmap(logger, originImageInfo, AUTO);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_DNG_NATIVE_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_DNG_NATIVE_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_DNG_NATIVE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_DNG_NATIVE_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let path = filesDir + "/test_dng.dng";
        const buffer = getBuffer(path);
        let size: image.Size = {width: 99, height: 200};
        let result = getPixelmap(logger, path, SHARE_MEMORY, size, YCRCB_P010);
        let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010);
        let ret = await testPixelmap(logger, originImageInfo, SHARE_MEMORY);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_DNG_NATIVE_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_DNG_NATIVE_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_DNG_NATIVE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_DNG_NATIVE_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let path = filesDir + "/test_dng.dng";
        const buffer = getBuffer(path);
        let size: image.Size = {width: 3071, height: 4096};
        let result = getPixelmap(logger, path, DMA, size, YCRCB_P010);
        let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010);
        let ret = await testPixelmap(logger, originImageInfo, DMA);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_DNG_NATIVE_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_DNG_NATIVE_0300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_DNG_NATIVE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_DNG_NATIVE_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let path = filesDir + "/test_dng.dng";
        const buffer = getBuffer(path);
        let size: image.Size = {width: 3071, height: 4096};
        let result = getPixelmap(logger, path, AUTO, size, YCRCB_P010);
        let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010);
        let ret = await testPixelmap(logger, originImageInfo, AUTO);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_HEIF_NATIVE_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_HEIF_NATIVE_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_HEIF_NATIVE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_HEIF_NATIVE_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
      } else {
        let path = filesDir + "/0801_sdr2.heic";
        const buffer = getBuffer(path);
        let size: image.Size = {width: 99, height: 200};
        let result = getPixelmap(logger, path, SHARE_MEMORY, size, YCRCB_P010);
        let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010);
        let ret = await testPixelmap(logger, originImageInfo, SHARE_MEMORY);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_HEIF_NATIVE_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_HEIF_NATIVE_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_HEIF_NATIVE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_HEIF_NATIVE_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
      } else {
        let path = filesDir + "/0801_sdr2.heic";
        const buffer = getBuffer(path);
        let size: image.Size = {width: 3071, height: 4096};
        let result = getPixelmap(logger, path, DMA, size, YCRCB_P010);
        let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010);
        let ret = await testPixelmap(logger, originImageInfo, DMA);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_HEIF_NATIVE_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_HEIF_NATIVE_0300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_HEIF_NATIVE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_HEIF_NATIVE_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
      } else {
        let path = filesDir + "/0801_sdr2.heic";
        const buffer = getBuffer(path);
        let size: image.Size = {width: 3071, height: 4096};
        let result = getPixelmap(logger, path, AUTO, size, YCRCB_P010);
        let originImageInfo = await getImageInfoFromPixelmapJS(logger, buffer, size, YCRCB_P010);
        let ret = await testPixelmap(logger, originImageInfo, AUTO);
        expect(ret).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_ERROR_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_ERROR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_ERROR_0100");
      let path = filesDir + "/" + twoParametersFile;
      let ret: number = ndkTest.CreatePixelMapUsingAllocatorError(path, AUTO);
      logger.log("create pixelmap error code is: " + ret);
      expect(ret == PARAMETER_ERROR).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_ERROR_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_ERROR_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_ERROR_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_ERROR_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let path = filesDir + "/" + test_DMA_3071_4095;
        let size: image.Size = {width: 99, height: 200};
        const result: number = ndkTest.CreatePixelMapUsingAllocator(path, SHARE_MEMORY, size, YCRCB_P010, RANGE_HDR);
        logger.log("create pixelmap error code is: " + result);
        expect(result == UNSUPPORTED_ALLOCATOR_TYPE).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_ERROR_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_ERROR_0300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_ERROR_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_ERROR_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let path = filesDir + "/" + test_DMA_3071_4095;
        let size: image.Size = {width: 3071, height: 4096};
        const result: number = ndkTest.CreatePixelMapUsingAllocator(path, SHARE_MEMORY, size, YCRCB_P010, RANGE_HDR);
        logger.log("create pixelmap error code is: " + result);
        expect(result == UNSUPPORTED_ALLOCATOR_TYPE).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_ERROR_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_ERROR_0400
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_ERROR_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_ERROR_0400");
      let path = filesDir + "/SIZE_0_0.jpg";
      let size: image.Size = {width: 3071, height: 4096};
      const result: number = ndkTest.CreatePixelMapUsingAllocator(path, AUTO, size, RGBA_8888);
      logger.log("create pixelmap error code is: " + result);
      expect(result == DECODE_FAILED).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_NATIVE_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_NATIVE_0100
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_NATIVE_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_NATIVE_0100");
      let expectInfo: ndkTest.decodeOptions = {
        width: 99,
        height: 200,
        pixelFormat: RGB_565,
        dynamicRange: RANGE_SDR,
        mimeType: "image/wbmp"
      };
      let ret = DecodeWbmpImageTest(logger, test_wbmp, expectInfo, AUTO);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_NATIVE_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_NATIVE_0200
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_NATIVE_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_NATIVE_0200");
      let expectInfo: ndkTest.decodeOptions = {
        width: 512,
        height: 512,
        pixelFormat: BGRA_8888,
        dynamicRange: RANGE_HDR,
        mimeType: "image/wbmp"
      };
      let ret = DecodeWbmpImageTest(logger, test_wbmp, expectInfo, AUTO);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_NATIVE_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_NATIVE_0300
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_NATIVE_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_NATIVE_0300");
      let expectInfo: ndkTest.decodeOptions = {
        width: 4001,
        height: 4096,
        pixelFormat: NV21,
        dynamicRange: RANGE_SDR,
        mimeType: "image/wbmp"
      };
      let ret = DecodeWbmpImageTest(logger, test_wbmp, expectInfo, SHARE_MEMORY);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_NATIVE_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_NATIVE_0400
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_NATIVE_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_NATIVE_0400");
      let expectInfo: ndkTest.decodeOptions = {
        width: 99,
        height: 200,
        pixelFormat: NV12,
        dynamicRange: RANGE_SDR,
        mimeType: "image/wbmp"
      };
      let ret = DecodeWbmpImageTest(logger, test_wbmp, expectInfo, SHARE_MEMORY);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_NATIVE_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_NATIVE_0500
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_NATIVE_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_NATIVE_0500");
      let expectInfo: ndkTest.decodeOptions = {
        width: 512,
        height: 512,
        pixelFormat: YCBCR_P010,
        dynamicRange: RANGE_SDR,
        mimeType: "image/wbmp"
      };
      let ret = DecodeWbmpImageTest(logger, test_wbmp, expectInfo, DMA);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_NATIVE_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_NATIVE_0600
     * @tc.desc   1.create pixelmap object by imageSource, set AllocatorType is DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_NATIVE_0600', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_NATIVE_0600");
      let expectInfo: ndkTest.decodeOptions = {
        width: 3072,
        height: 4096,
        pixelFormat: YCRCB_P010,
        dynamicRange: RANGE_HDR,
        mimeType: "image/wbmp"
      };
      let ret = DecodeWbmpImageTest(logger, test_wbmp, expectInfo, DMA);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0100
     * @tc.desc        1.create pixelmap object by imageSource
     *                 2.set DecodingOptions
     *                 3.verify pixelmap info
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0100");
      if (!isSupportTiff) {
        logger.log("device is not support tiff");
        done();
        return;
      }
      let filePath = filesDir + "/" + "1920x1080_Deflate.tiff";
      let desiredInfo: ndkTest.decodeOptions = {
        width: 2048,
        height: 2048,
        pixelFormat: RGB_565,
        mimeType: "image/tiff"
      };
      let ret = await decodeTiffTestInTaskPool(logger, filePath, desiredInfo);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0200
     * @tc.desc        1.create pixelmap object by imageSource
     *                 2.set DecodingOptions
     *                 3.verify pixelmap info
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0200");
      if (!isSupportTiff) {
        logger.log("device is not support tiff");
        done();
        return;
      }
      let filePath = filesDir + "/" + "1920x1080_G3.tiff";
      let desiredInfo: ndkTest.decodeOptions = {
        width: 2048,
        height: 2048,
        pixelFormat: RGB_565,
        mimeType: "image/tiff"
      };
      let ret = await decodeTiffTestInTaskPool(logger, filePath, desiredInfo);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0300
     * @tc.desc        1.create pixelmap object by imageSource
     *                 2.set DecodingOptions
     *                 3.verify pixelmap info
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0300");
      if (!isSupportTiff) {
        logger.log("device is not support tiff");
        done();
        return;
      }
      let filePath = filesDir + "/" + "1920x1080_G4.tiff";
      let desiredInfo: ndkTest.decodeOptions = {
        width: 2048,
        height: 2048,
        pixelFormat: RGB_565,
        mimeType: "image/tiff"
      };
      let ret = await decodeTiffTestInTaskPool(logger, filePath, desiredInfo);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0400
     * @tc.desc        1.create pixelmap object by imageSource
     *                 2.set DecodingOptions
     *                 3.verify pixelmap info
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0400");
      if (!isSupportTiff) {
        logger.log("device is not support tiff");
        done();
        return;
      }
      let filePath = filesDir + "/" + "1920x1080_Jpeg.tiff";
      let desiredInfo: ndkTest.decodeOptions = {
        width: 2048,
        height: 2048,
        pixelFormat: RGB_565,
        mimeType: "image/tiff"
      };
      let ret = await decodeTiffTestInTaskPool(logger, filePath, desiredInfo, SHARE_MEMORY);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0500
     * @tc.desc        1.create pixelmap object by imageSource
     *                 2.set DecodingOptions
     *                 3.verify pixelmap info
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0500");
      if (!isSupportTiff) {
        logger.log("device is not support tiff");
        done();
        return;
      }
      let filePath = filesDir + "/" + "1920x1080_Lzw.tiff";
      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGBA_8888,
        mimeType: "image/tiff"
      };
      let ret = await decodeTiffTestInTaskPool(logger, filePath, desiredInfo, SHARE_MEMORY);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0600
     * @tc.desc        1.create pixelmap object by imageSource
     *                 2.set DecodingOptions
     *                 3.verify pixelmap info
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0600', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0600");
      if (!isSupportTiff) {
        logger.log("device is not support tiff");
        done();
        return;
      }
      let filePath = filesDir + "/" + "1920x1080_Next.tiff";
      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGBA_8888,
        mimeType: "image/tiff"
      };
      let ret = await decodeTiffTestInTaskPool(logger, filePath, desiredInfo, SHARE_MEMORY);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0700
     * @tc.desc        1.create pixelmap object by imageSource
     *                 2.set DecodingOptions
     *                 3.verify pixelmap info
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0700', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0700");
      if (!isSupportTiff) {
        logger.log("device is not support tiff");
        done();
        return;
      }
      let filePath = filesDir + "/" + "1920x1080_none.tiff";
      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGBA_8888,
        mimeType: "image/tiff"
      };
      let ret = await decodeTiffTestInTaskPool(logger, filePath, desiredInfo, SHARE_MEMORY);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0800
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0800
     * @tc.desc        1.create pixelmap object by imageSource
     *                 2.set DecodingOptions
     *                 3.verify pixelmap info
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0800', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0800");
      if (!isSupportTiff) {
        logger.log("device is not support tiff");
        done();
        return;
      }
      let filePath = filesDir + "/" + "1920x1080_Packbits.tiff";
      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGBA_8888,
        mimeType: "image/tiff"
      };
      let ret = await decodeTiffTestInTaskPool(logger, filePath, desiredInfo, DMA);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0900
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0900
     * @tc.desc        1.create pixelmap object by imageSource
     *                 2.set DecodingOptions
     *                 3.verify pixelmap info
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0900', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_0900");
      if (!isSupportTiff) {
        logger.log("device is not support tiff");
        done();
        return;
      }
      let filePath = filesDir + "/" + "1920x1080_PixarLog_RGB.tiff";
      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: BGRA_8888,
        mimeType: "image/tiff"
      };
      let ret = await decodeTiffTestInTaskPool(logger, filePath, desiredInfo, DMA);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_1000
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_1000
     * @tc.desc        1.create pixelmap object by imageSource
     *                 2.set DecodingOptions
     *                 3.verify pixelmap info
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_1000', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_1000");
      if (!isSupportTiff) {
        logger.log("device is not support tiff");
        done();
        return;
      }
      let filePath = filesDir + "/" + "1920x1080_SGILOG_gray16.tiff";
      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: BGRA_8888,
        mimeType: "image/tiff",
        desiredRegion: { x: 0, y: 0, width: 150, height: 150 },
        cropAndScaleStrategy: CROP_FIRST
      };
      let ret = await decodeTiffTestInTaskPool(logger, filePath, desiredInfo, DMA);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_1100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_1100
     * @tc.desc        1.create pixelmap object by imageSource
     *                 2.set DecodingOptions
     *                 3.verify pixelmap info
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_1100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_DMA_TIFF_NATIVE_1100");
      if (!isSupportTiff) {
        logger.log("device is not support tiff");
        done();
        return;
      }
      let filePath = filesDir + "/" + "thunderscan-1920x1080.tiff";
      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: BGRA_8888,
        mimeType: "image/tiff",
        desiredRegion: { x: 0, y: 0, width: 150, height: 150 },
        cropAndScaleStrategy: SCALE_FIRST
      };
      let ret = await decodeTiffTestInTaskPool(logger, filePath, desiredInfo, DMA);
      expect(ret).assertTrue();
      done();
    })
  })
}