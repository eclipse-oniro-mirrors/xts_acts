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

const domain = 0x0000;
const testTag = 'PixelmapNdkTest';
const twoParametersFile = "test_DMA_1801_4041.jpg";
const test_DMA_3071_4095 = "test_DMA_3071_4095.jpg";
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
let isSupportHdr: boolean = false;
let isSupportHEIFDecode: boolean = false;
let testContext: common.UIAbilityContext;
let filesDir: string|undefined;
let cacheDir: string|undefined;

export default function pixelmapNdkForDMATest() {
  describe('pixelMapNdkForDMATest', () => {
    beforeAll(() => {
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      filesDir = AppStorage.get('pathDir');
      cacheDir = AppStorage.get('cacheDir');
      isSupportHdr = !display.getDefaultDisplaySync().hdrFormats.includes(hdrCapability.HDRFormat.NONE) &&
        display.getDefaultDisplaySync().hdrFormats.length != 0;
      isSupportHEIFDecode =
        image.createImageSource(filesDir + '/' + "test.jpg").supportedFormats.includes("image/heic");
    })

    class Logger {
      testNum: string;
  
      constructor(testNum: string) {
        this.testNum = testNum;
      }
  
      log(msg: string) {
        hilog.info(0x0000, "imagePixelmapNdk", 'case: %{public}s msg:%{public}s', this.testNum, msg);
      }
    }

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

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: RGBA_F16
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 256, height: 256},
     *                       desiredPixelFormat: BGRA_8888
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0400
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 512, height: 512},
     *                       desiredPixelFormat: NV21
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0500
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 4000, height: 4096},
     *                       desiredPixelFormat: NV12
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0600
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 3072, height: 4096},
     *                       desiredPixelFormat: RGBA_1010102
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0700
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0800
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 256, height: 256},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0900
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_0901
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 3072, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1000
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 3072, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1101
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1102
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 256, height: 256},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010
     *                       desiredDynamicRange: RANGE_HDR
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 4001, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     *                       desiredDynamicRange: RANGE_HDR
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1400
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010
     *                       desiredDynamicRange: RANGE_HDR
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1500
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     *                       desiredDynamicRange: RANGE_HDR
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_1500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_PNG_NATIVE_0100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_PNG_NATIVE_0200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_PNG_NATIVE_0300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_GIF_NATIVE_0100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_GIF_NATIVE_0200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_GIF_NATIVE_0300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_ICO_NATIVE_0100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_ICO_NATIVE_0200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_ICO_NATIVE_0300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_BMP_NATIVE_0100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_BMP_NATIVE_0200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_BMP_NATIVE_0300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_WEBP_NATIVE_0100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_WEBP_NATIVE_0200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_WEBP_NATIVE_0300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_DNG_NATIVE_0100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_DNG_NATIVE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_DNG_NATIVE_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_DNG_NATIVE_0200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_DNG_NATIVE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_DNG_NATIVE_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_DNG_NATIVE_0300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_DNG_NATIVE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_DNG_NATIVE_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_HEIF_NATIVE_0100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_HEIF_NATIVE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_HEIF_NATIVE_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_HEIF_NATIVE_0200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_HEIF_NATIVE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_HEIF_NATIVE_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_HEIF_NATIVE_0300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_HEIF_NATIVE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_HEIF_NATIVE_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_ERROR_0100
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_ERROR_0200
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 99, height: 200},
     *                       desiredPixelFormat: YCRCB_P010
     *                       desiredDynamicRange: RANGE_HDR
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_ERROR_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_ERROR_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_ERROR_0300
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: YCRCB_P010
     *                       desiredDynamicRange: RANGE_HDR
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_ERROR_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_ERROR_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_JPEG_NATIVE_ERROR_0400
     * @tc.name      : test Image createPixelmap
     * @tc.desc      : 1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions
     *                       desiredSize: {width: 3071, height: 4096},
     *                       desiredPixelFormat: RGBA_8888
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
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
  })
}