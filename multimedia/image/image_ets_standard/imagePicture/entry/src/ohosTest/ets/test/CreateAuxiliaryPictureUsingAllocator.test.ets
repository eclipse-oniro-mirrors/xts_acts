/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import common from '@ohos.app.ability.common';
import hilog from '@ohos.hilog';
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';

const TAG = 'createAuxiliaryPictureUsingAllocatorTest';
const RGB_565      = image.PixelMapFormat.RGB_565;
const RGBA_8888    = image.PixelMapFormat.RGBA_8888;
const BGRA_8888    = image.PixelMapFormat.BGRA_8888;
const RGB_888      = image.PixelMapFormat.RGB_888;
const ALPHA_8      = image.PixelMapFormat.ALPHA_8;
const RGBA_F16     = image.PixelMapFormat.RGBA_F16;
const NV21         = image.PixelMapFormat.NV21;
const NV12         = image.PixelMapFormat.NV12;
const RGBA_1010102 = image.PixelMapFormat.RGBA_1010102;
const YCBCR_P010   = image.PixelMapFormat.YCBCR_P010;
const YCRCB_P010   = image.PixelMapFormat.YCRCB_P010;

const GAINMAP = image.AuxiliaryPictureType.GAINMAP;
const DEPTH_MAP = image.AuxiliaryPictureType.DEPTH_MAP;
const UNREFOCUS_MAP = image.AuxiliaryPictureType.UNREFOCUS_MAP;
const LINEAR_MAP = image.AuxiliaryPictureType.LINEAR_MAP;
const FRAGMENT_MAP = image.AuxiliaryPictureType.FRAGMENT_MAP;
const UNSUPPORTED_ALLOCATOR_TYPE = 7600205;
const INVALID_PARAMETER = 7600206;
let isSupportHEIFDecode: boolean;

class Logger {
  testNum: string;

  constructor(testNum: string) {
  this.testNum = testNum;
  }

  log(msg: string) {
  hilog.info(0x0000, "createAuxPicUsingAllocatorTest", 'case: %{public}s msg:%{public}s', this.testNum, msg);
  }
}

function getPixelMapFormatBytes(pixelFormat: image.PixelMapFormat): number {
  let formatBytes = 0;
  switch (pixelFormat) {
    case RGB_565:
    case NV21:
    case NV12:
      formatBytes = 2;
      break;
    case RGBA_8888:
    case BGRA_8888:
    case RGBA_1010102:
    case YCBCR_P010:
    case YCRCB_P010:
      formatBytes = 4;
      break;
    case RGB_888:
      formatBytes = 3;
    case ALPHA_8:
      formatBytes = 1;
      break;
    case RGBA_F16:
      formatBytes = 8;
      break;
  }
  return formatBytes;
}

function createAuxiliaryPictureByAllocatorType(
  logger: Logger,
  auxInfo: image.AuxiliaryPictureInfo,
  allocatorType: image.AllocatorType,
  pixels: ArrayBuffer|undefined,
  errorCode?: number
): boolean {
  if (pixels == undefined) {
    logger.log("pixels is undefined");
    return false;
  }
  try {
    auxInfo.rowStride = auxInfo.size.width * getPixelMapFormatBytes(auxInfo.pixelFormat);
    let auxiliaryPicture: image.AuxiliaryPicture = image.createAuxiliaryPictureUsingAllocator(auxInfo, allocatorType, pixels);
    let getAuxType = auxiliaryPicture.getType();
    let getAuxInfo = auxiliaryPicture.getAuxiliaryPictureInfo();
    auxiliaryPicture.release();
    logger.log("auxType: " + getAuxType);
    logger.log("auxInfo: " + JSON.stringify(getAuxInfo));
    let ret = getAuxType == auxInfo.auxiliaryPictureType &&
              getAuxInfo.size.width  == auxInfo.size.width &&
              getAuxInfo.size.height == auxInfo.size.height &&
              getAuxInfo.rowStride   == auxInfo.rowStride &&
              getAuxInfo.pixelFormat == auxInfo.pixelFormat;
    if (errorCode != undefined) {
      logger.log("expected error code: " + errorCode + ", but createAuxiliaryPictureUsingAllocator success!");
      return false;
    }
    logger.log("ret = " + ret);
    return ret;
  } catch (error) {
    logger.log(`createAuxiliaryPictureUsingAllocator failed: error code: ${error.code}, error message: ${error.message}`);
    if (errorCode != undefined) {
      logger.log(`compare error.code: ${error.code} (${typeof error.code}), errorCode: ${errorCode} (${typeof errorCode})`);
      return Number(error.code) === errorCode;
    }
    return false;
  }
}

export default function createAuxiliaryPictureUsingAllocatorTest() {
  let filesDir: string|undefined;

  describe('createAuxiliaryPictureUsingAllocatorTest', () => {
    beforeAll(async () => {
      filesDir = AppStorage.get('pathDir')
      isSupportHEIFDecode =
        image.getImageSourceSupportedFormats().includes("image/heic");
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    const getPixelsBuffer = async (logger: Logger, fileName: string, format: image.PixelMapFormat): Promise<ArrayBuffer|undefined> => {
      try {
        const filePath = filesDir + '/' + fileName;
        let imageSource = image.createImageSource(filePath);
        let decodeOpts: image.DecodingOptions = {
          desiredPixelFormat: format,
        }
        let pixelMap = await imageSource.createPixelMap(decodeOpts);
        let info = pixelMap.getImageInfoSync();
        logger.log("pixelMap Info: " + JSON.stringify(info));
        let bufferSize = pixelMap.getPixelBytesNumber();
        let arrayBuffer = new ArrayBuffer(bufferSize);
        await pixelMap.readPixelsToBuffer(arrayBuffer);
        logger.log("arrayBuffer byteLength: " + arrayBuffer.byteLength);
        await imageSource.release();
        await pixelMap.release();
        return arrayBuffer;
      } catch (error) {
        logger.log("error, code: " + error.code + " message: " + error.message);
        return undefined;
      }
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_0100
     * @tc.desc   1.create auxiliary picture
     *            2.set auxiliary picture info, no allocator type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_0100', Level.LEVEL0, async (done: Function) => {
      const logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_0100");
      if (!isSupportHEIFDecode) {
        logger.log("The device is not support decode heic. Skip this case.");
        done();
        return;
      }
      try {
        let formatBytes = getPixelMapFormatBytes(RGB_565);
        const auxInfo: image.AuxiliaryPictureInfo = {
          auxiliaryPictureType: GAINMAP,
          size: {width: 256, height: 256},
          rowStride: 256 * formatBytes,
          pixelFormat: RGB_565,
          colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998)
        };
        let auxiliaryPicture: image.AuxiliaryPicture = image.createAuxiliaryPictureUsingAllocator(auxInfo);
        let auxType = auxiliaryPicture.getType();
        auxiliaryPicture.release();
        logger.log("auxType:" + auxType);
        expect(auxType == GAINMAP).assertTrue();
        done();
      } catch (error) {
        logger.log("error:" + error.code + ", " + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_0200
     * @tc.desc   1.create auxiliary picture
     *            2.set auxiliary picture info, allocator type AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_0200', Level.LEVEL0, async (done: Function) => {
      const logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_0200");
      let formatBytes = getPixelMapFormatBytes(RGBA_8888);
      const auxInfo: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: GAINMAP,
        size: {width: 256, height: 256},
        rowStride: 256 * formatBytes,
        pixelFormat: RGBA_8888,
        colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3)
      };
      let auxiliaryPicture: image.AuxiliaryPicture = image.createAuxiliaryPictureUsingAllocator(auxInfo, image.AllocatorType.AUTO);
      let auxType = auxiliaryPicture.getType();
      auxiliaryPicture.release();
      logger.log("auxType:" + auxType);
      expect(auxType == GAINMAP).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_0300
     * @tc.desc   1.create auxiliary picture
     *            2.set auxiliary picture info, allocator type AUTO and buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_0300', Level.LEVEL0, async (done: Function) => {
      const logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_0300");
      const auxInfo: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: GAINMAP,
        size: {width: 256, height: 256},
        rowStride: 256,
        pixelFormat: BGRA_8888,
        colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3)
      };
      const buffer = await getPixelsBuffer(logger, "testExif.jpg", BGRA_8888);
      const ret = createAuxiliaryPictureByAllocatorType(logger, auxInfo, image.AllocatorType.AUTO, buffer);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_0400
     * @tc.desc   1.create auxiliary picture
     *            2.set auxiliary picture info, allocator type AUTO and buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_0400', Level.LEVEL0, async (done: Function) => {
      const logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_0400");
      if (!isSupportHEIFDecode) {
        logger.log("The device is not support decode heic. Skip this case.");
        done();
        return;
      }
      const auxInfo: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: DEPTH_MAP,
        size: {width: 256, height: 256},
        rowStride: 256,
        pixelFormat: RGBA_F16,
        colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB)
      };
      const buffer = await getPixelsBuffer(logger, "testExif.jpg", RGBA_F16);
      const ret = createAuxiliaryPictureByAllocatorType(logger, auxInfo, image.AllocatorType.AUTO, buffer);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_0500
     * @tc.desc   1.create auxiliary picture
     *            2.set auxiliary picture info, allocator type SHARE_MEMORY and buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_0500', Level.LEVEL0, async (done: Function) => {
      const logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_0500");
      if (!isSupportHEIFDecode) {
        logger.log("The device is not support decode heic. Skip this case.");
        done();
        return;
      }
      const auxInfo: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: UNREFOCUS_MAP,
        size: {width: 512, height: 512},
        rowStride: 512,
        pixelFormat: RGBA_1010102,
        colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT709)
      };
      const buffer = await getPixelsBuffer(logger, "testExif.jpg", RGBA_1010102);
      const ret = createAuxiliaryPictureByAllocatorType(logger, auxInfo, image.AllocatorType.SHARE_MEMORY, buffer);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_0600
     * @tc.desc   1.create auxiliary picture
     *            2.set auxiliary picture info, allocator type SHARE_MEMORY and buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_0600', Level.LEVEL0, async (done: Function) => {
      const logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_0600");
      if (!isSupportHEIFDecode) {
        logger.log("The device is not support encode heic. Skip this case.");
        done();
        return;
      }
      const auxInfo: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: LINEAR_MAP,
        size: {width: 512, height: 512},
        rowStride: 512 * getPixelMapFormatBytes(YCBCR_P010),
        pixelFormat: YCBCR_P010,
        colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_EBU)
      };
      const buffer = await getPixelsBuffer(logger, "testExif.jpg", YCBCR_P010);
      let auxiliaryPicture: image.AuxiliaryPicture = image.createAuxiliaryPictureUsingAllocator(auxInfo, image.AllocatorType.DMA, buffer);
      let getAuxType = auxiliaryPicture.getType();
      let getAuxInfo = auxiliaryPicture.getAuxiliaryPictureInfo();
      auxiliaryPicture.release();
      logger.log("auxType: " + getAuxType);
      logger.log("auxInfo: " + JSON.stringify(getAuxInfo));
      let ret = getAuxType == auxInfo.auxiliaryPictureType &&
                getAuxInfo.size.width  == auxInfo.size.width &&
                getAuxInfo.size.height == auxInfo.size.height &&
                getAuxInfo.pixelFormat == auxInfo.pixelFormat;
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_0700
     * @tc.desc   1.create auxiliary picture
     *            2.set auxiliary picture info, allocator type DMA and buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_0700', Level.LEVEL0, async (done: Function) => {
      const logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_0700");
      if (!isSupportHEIFDecode) {
        logger.log("The device is not support encode heic. Skip this case.");
        done();
        return;
      }
      const auxInfo: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: FRAGMENT_MAP,
        size: {width: 1024, height: 2049},
        rowStride: 1024 * getPixelMapFormatBytes(YCRCB_P010),
        pixelFormat: YCRCB_P010,
        colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C)
      };
      const buffer = await getPixelsBuffer(logger, "0801_sdr2.heic", YCRCB_P010);
      let auxiliaryPicture: image.AuxiliaryPicture = image.createAuxiliaryPictureUsingAllocator(auxInfo, image.AllocatorType.DMA, buffer);
      let getAuxType = auxiliaryPicture.getType();
      let getAuxInfo = auxiliaryPicture.getAuxiliaryPictureInfo();
      auxiliaryPicture.release();
      logger.log("auxType: " + getAuxType);
      logger.log("auxInfo: " + JSON.stringify(getAuxInfo));
      let ret = getAuxType == auxInfo.auxiliaryPictureType &&
                getAuxInfo.size.width  == auxInfo.size.width &&
                getAuxInfo.size.height == auxInfo.size.height &&
                getAuxInfo.pixelFormat == auxInfo.pixelFormat;
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_ERROR_0100
     * @tc.desc   1.create auxiliary picture
     *            2.set incorrect auxiliary image information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_ERROR_0100', Level.LEVEL0, async (done: Function) => {
      const logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_ERROR_0100");
      const auxInfo: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: DEPTH_MAP,
        size: {width: 0, height: 5},
        rowStride: 10,
        pixelFormat: RGBA_8888,
        colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB)
      };
      const buffer = await getPixelsBuffer(logger, "testExif.jpg", RGBA_8888);
      const ret = createAuxiliaryPictureByAllocatorType(logger, auxInfo, image.AllocatorType.AUTO, buffer, INVALID_PARAMETER);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_ERROR_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_ERROR_0200
     * @tc.desc   1.create auxiliary picture
     *            2.set incorrect auxiliary image information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_ERROR_0200', Level.LEVEL0, async (done: Function) => {
      const logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_ERROR_0200");
      const auxInfo: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: DEPTH_MAP,
        size: {width: 5, height: -1},
        rowStride: 10,
        pixelFormat: RGBA_8888,
        colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB)
      };
      const buffer = await getPixelsBuffer(logger, "testExif.jpg", RGBA_8888);
      const ret = createAuxiliaryPictureByAllocatorType(logger, auxInfo, image.AllocatorType.AUTO, buffer, INVALID_PARAMETER);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_ERROR_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_ERROR_0300
     * @tc.desc   1.create auxiliary picture
     *            2.set incorrect auxiliary image information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_ERROR_0300', Level.LEVEL0, async (done: Function) => {
      const logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_ERROR_0300");
      const auxInfo: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: DEPTH_MAP,
        size: {width: 256, height: 256},
        rowStride: -1,
        pixelFormat: RGBA_8888,
        colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB)
      };
      const buffer = await getPixelsBuffer(logger, "testExif.jpg", RGBA_8888);
      try {
        let auxiliaryPicture: image.AuxiliaryPicture = image.createAuxiliaryPictureUsingAllocator(auxInfo, image.AllocatorType.AUTO, buffer);
        logger.log("auxiliaryPicture created successfully, but expected to fail.");
        expect().assertFail();
      } catch (error) {
        logger.log("create auxiliaryPicture error:" + error.code + ", " + error.message);
        expect(Number(error.code) === INVALID_PARAMETER).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_ERROR_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_ERROR_0400
     * @tc.desc   1.create auxiliary picture
     *            2.set incorrect auxiliary image information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_ERROR_0400', Level.LEVEL0, async (done: Function) => {
      const logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_ERROR_0400");
      const auxInfo: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: GAINMAP,
        size: {width: 256, height: 256},
        rowStride: 10,
        pixelFormat: RGBA_8888,
        colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB)
      };
      const buffer = await getPixelsBuffer(logger, "testExif.jpg", RGBA_8888);
      const ret = createAuxiliaryPictureByAllocatorType(logger, auxInfo, image.AllocatorType.SHARE_MEMORY, buffer, UNSUPPORTED_ALLOCATOR_TYPE);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_ERROR_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_ERROR_0500
     * @tc.desc   1.create auxiliary picture
     *            2.set incorrect auxiliary image information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_ERROR_0500', Level.LEVEL0, async (done: Function) => {
      const logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_ERROR_0500");
      if (!isSupportHEIFDecode) {
        logger.log("The device is not support encode heic. Skip this case.");
        done();
        return;
      }
      const auxInfo: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: GAINMAP,
        size: {width: 256, height: 256},
        rowStride: 10,
        pixelFormat: NV21,
        colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB)
      };
      const buffer = await getPixelsBuffer(logger, "testExif.jpg", NV21);
      const ret = createAuxiliaryPictureByAllocatorType(logger, auxInfo, image.AllocatorType.AUTO, buffer, INVALID_PARAMETER);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_ERROR_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_ERROR_0600
     * @tc.desc   1.create auxiliary picture
     *            2.set incorrect auxiliary image information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_ERROR_0600', Level.LEVEL0, async (done: Function) => {
      const logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_AUXILIARY_PICTURE_ERROR_0600");
      const auxInfo: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: GAINMAP,
        size: {width: 4096, height: 4096},
        rowStride: 10,
        pixelFormat: RGBA_8888,
        colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB)
      };
      const buffer = await getPixelsBuffer(logger, "test.jpg", RGBA_8888);
      const ret = createAuxiliaryPictureByAllocatorType(logger, auxInfo, image.AllocatorType.AUTO, buffer, INVALID_PARAMETER);
      expect(ret).assertTrue();
      done();
    })
  })
}