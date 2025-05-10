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

import { describe, beforeAll, afterEach, it, expect, Level, Size, TestType } from '@ohos/hypium';
import ndkTest from 'libPixelMapNdk.so';
import image from "@ohos.multimedia.image";
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import hilog from '@ohos.hilog';
import display from '@ohos.display';
import hdrCapability from '@ohos.graphics.hdrCapability';

const domain = 0x0000;
const testTag = 'PixelmapNdkTest';
let isSupportHdr: boolean = false;
let isSupportHeifDecode: boolean = false;
let isSupportHeicEncode: boolean = false;
let testContext: common.UIAbilityContext;

const IMAGE_SUCCESS = 0;
const UNSUPPORTED_ALLOCATOR_TYPE = 7700201;
const packBuffer = new ArrayBuffer(10000 * 10000);
const ARGB_8888 = image.PixelMapFormat.ARGB_8888;
const AUTO = image.DecodingDynamicRange.AUTO;
const HDR = image.DecodingDynamicRange.HDR;
const SDR = image.DecodingDynamicRange.SDR;
const packFile = 'Pack_PixelMap_ARGB.jpg';
const supportedARGBDecodeFileList: Array<string> = ['test.jpg', 'test.png', 'test.bmp', 'moving_test.gif', 'test.webp',
  'test.ico', 'test_dng.dng', 'test.svg', 'CUVAHdrMulti.jpg'];
const supportedPackFormatList: Array<string> = ['image/jpeg', 'image/png', 'image/heif', 'image/gif', 'image/webp'];

function getFilePath(fileName: string): string {
  let filePath = AppStorage.get('pathDir') + "/" + fileName;
  return filePath;
}

function getCachePath(fileName: string): string {
  let filePath = AppStorage.get('cacheDir') + "/" + fileName;
  return filePath;
}

function clearBuffer(buffer: ArrayBuffer) {
  let view = new Uint8Array(buffer);
  view.fill(0);
}

class Logger {
  testNum: string;

  constructor(testNum: string) {
    this.testNum = testNum;
  }

  log(msg: string) {
    hilog.info(domain, "imagePixelmapNdk", 'case: %{public}s msg:%{public}s', this.testNum, msg);
  }
}

const testCreatePackOptions = (format: string, quality: number, desiredDynamicRange?: image.PackingDynamicRange,
  needsPackProperties?: boolean) => {
  let packOpt: image.PackingOption = ndkTest.CreatePackingOptions();
  ndkTest.SetMimeTypeToTestPackingOptions(packOpt, format);
  ndkTest.SetQualityToTestPackingOptions(packOpt, quality);
  if(desiredDynamicRange != undefined) {
    ndkTest.SetDynamicRangeToTestPackingOptions(packOpt, desiredDynamicRange);
  }
  if(needsPackProperties != undefined) {
    ndkTest.SetNeedsPackPropertiesToTestPackingOptions(packOpt, needsPackProperties);
  }
  return packOpt;
}

const testCreatePixelMapFromUri = (
  fileName: string,
  inputFormat: image.PixelMapFormat,
  type: boolean,
  DynamicRange: image.DecodingDynamicRange,
  allocatorType: image.AllocatorType
) => {
  let inputPath: string = getFilePath(fileName);
  let pixelmap: image.PixelMap = ndkTest.CreatePixelMapByImageSourceFromUri(inputPath, inputFormat, type, DynamicRange, allocatorType);
  expect(pixelmap != undefined).assertTrue();
  let pixelFormat: image.PixelMapFormat = ndkTest.GetPixelmapPixelFormat(pixelmap);
  console.info(`CreatePixelMapByImageSourceFromUri success, The pixelmapFormat is ${pixelFormat}`);
  expect(pixelFormat == inputFormat).assertTrue();
  console.info('Create PixelMap From Uri Success!');
  return pixelmap;
}

const testPackPixelMap = (
  pixelmap: image.PixelMap,
  packOpt: image.PackingOption,
  dst: string,
  fileName?: string
) => {
  console.info('Start PackPixelMap!');
  if(dst == 'PackToFile') {
    if (fileName != undefined) {
      let outputPath: string = getFilePath(fileName);
      let file = fs.openSync(outputPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      expect(ndkTest.PackPixelMapToFile(pixelmap, packOpt, file.fd)).assertEqual(IMAGE_SUCCESS);
      fs.closeSync(file.fd);
    } else {
      console.info("testPackPixelMap fileName is undefined");
    }
  } else {
    clearBuffer(packBuffer);
    expect(ndkTest.PackPixelMapToData(pixelmap, packOpt, packBuffer)).assertEqual(IMAGE_SUCCESS);
  }
  console.info('PackPixelMap Success!');
}

const checkPackPixelMap = (dst: string, fileName?: string) => {
  console.info('Start to check PackPixelMap');
  let pixelmap: image.PixelMap | undefined = undefined;
  if(dst == 'PackToFile') {
    if (fileName != undefined) {
      let outputPath: string = getFilePath(fileName);
      pixelmap = ndkTest.CreatePixelMapByImageSourceFromUri(outputPath, image.PixelMapFormat.RGBA_8888, false, AUTO, image.AllocatorType.SHARE_MEMORY);
    } else {
      console.info("testPackPixelMap fileName is undefined");
    }
  } else {
    pixelmap = ndkTest.CreatePixelMapByImageSourceFromBuffer(packBuffer, image.PixelMapFormat.RGBA_8888);
  }
  expect(pixelmap != undefined).assertTrue();
  let pixelFormat: image.PixelMapFormat = ndkTest.GetPixelmapPixelFormat(pixelmap);
  expect(pixelFormat == image.PixelMapFormat.RGBA_8888).assertTrue();
  console.info('Check PackPixelMap Success!');
}

export default function pixelmapARGBNdkTest() {
  describe('pixelMapNdkForArgbTest', () => {
    beforeAll(() => {
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      isSupportHdr = !display.getDefaultDisplaySync().hdrFormats.includes(hdrCapability.HDRFormat.NONE) &&
        display.getDefaultDisplaySync().hdrFormats.length != 0;
      isSupportHeifDecode =
        image.createImageSource(AppStorage.get('pathDir') + '/' + "test.jpg").supportedFormats.includes("image/heic");
      isSupportHeicEncode = 
        image.createImagePacker().supportedFormats.includes("image/heic");
    })

    const testCaseForDecodeARGBPixelMap = (
      logger: Logger,
      done: Function,
      fileName: string,
      inputFormat: image.PixelMapFormat,
      type: boolean,
      allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY
    ) => {
      logger.log('begin');
      try {
        let pixelmap: image.PixelMap = testCreatePixelMapFromUri(fileName, inputFormat, type, AUTO, allocatorType);
        expect(pixelmap != undefined).assertTrue();
        let pixelFormat: image.PixelMapFormat = ndkTest.GetPixelmapPixelFormat(pixelmap);
        expect(pixelFormat == inputFormat).assertTrue();
        ndkTest.PixelMapRelease(pixelmap);
        done();
      } catch (err) {
        logger.log(`Test exception: ${JSON.stringify(err)}`);
        expect().assertFalse();
        done();
      }
    }

    const testCaseForEncodeARGBPixelMap = (
      logger: Logger,
      done: Function,
      packOpt: image.PackingOption,
      dst: string,
      type: boolean,
      DecodeFileList: string,
      fileName?: string
    ) => {
      logger.log('begin');
      try {
        let pixelmap: image.PixelMap;
        pixelmap = testCreatePixelMapFromUri(DecodeFileList, ARGB_8888, type, AUTO, image.AllocatorType.SHARE_MEMORY);
        testPackPixelMap(pixelmap, packOpt, dst, fileName);
        checkPackPixelMap(dst, fileName);
        ndkTest.PackingOptionsRelease(packOpt);
        ndkTest.PixelMapRelease(pixelmap);
        done();
      } catch (err) {
        logger.log(`Test exception: ${JSON.stringify(err)}`);
        expect().assertFalse();
        done();
      }
    }

    /*
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_0100
     * @tc.name      : CreatePixelMapWithARGB8888
     * @tc.desc      : Test create pixelmap when the format is ARGB_8888.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_0100");
      testCaseForDecodeARGBPixelMap(logger, done, supportedARGBDecodeFileList[0], ARGB_8888, false);
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_0200
     * @tc.name      : CreatePixelMapWithARGB8888
     * @tc.desc      : Test create pixelmap when the format is ARGB_8888.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_0200");
      testCaseForDecodeARGBPixelMap(logger, done, supportedARGBDecodeFileList[1], ARGB_8888, false);
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_0300
     * @tc.name      : CreatePixelMapWithARGB8888
     * @tc.desc      : Test create pixelmap when the format is ARGB_8888.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_0300");
      testCaseForDecodeARGBPixelMap(logger, done, supportedARGBDecodeFileList[2], ARGB_8888, false);
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_0400
     * @tc.name      : CreatePixelMapWithARGB8888
     * @tc.desc      : Test create pixelmap when the format is ARGB_8888.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_0400");
      if (isSupportHdr) {
        testCaseForDecodeARGBPixelMap(logger, done, supportedARGBDecodeFileList[3], ARGB_8888, false);
      } else {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_0500
     * @tc.name      : CreatePixelMapWithARGB8888
     * @tc.desc      : Test create pixelmap when the format is ARGB_8888.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_0500");
      testCaseForDecodeARGBPixelMap(logger, done, supportedARGBDecodeFileList[4], ARGB_8888, false);
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_0600
     * @tc.name      : CreatePixelMapWithARGB8888
     * @tc.desc      : Test create pixelmap when the format is ARGB_8888.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_0600");
      testCaseForDecodeARGBPixelMap(logger, done, supportedARGBDecodeFileList[5], ARGB_8888, false);
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_0700
     * @tc.name      : CreatePixelMapWithARGB8888
     * @tc.desc      : Test create pixelmap when the format is ARGB_8888.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_0700");
      if (isSupportHdr) {
        testCaseForDecodeARGBPixelMap(logger, done, supportedARGBDecodeFileList[6], ARGB_8888, false);
      } else {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_0800
     * @tc.name      : CreatePixelMapWithARGB8888
     * @tc.desc      : Test create pixelmap when the format is ARGB_8888.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_0800");
      testCaseForDecodeARGBPixelMap(logger, done, supportedARGBDecodeFileList[7], ARGB_8888, false);
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_0900
     * @tc.name      : CreatePixelMapWithARGB8888
     * @tc.desc      : Test create pixelmap when the format is ARGB_8888.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_0900");
      if (isSupportHdr) {
        try {
          let inputPath: string = getFilePath(supportedARGBDecodeFileList[8]);
          let pixelmap: image.PixelMap = ndkTest.CreatePixelMapByImageSourceFromUri(inputPath, ARGB_8888, false, HDR, image.AllocatorType.DMA);
          expect(pixelmap != undefined).assertTrue();
          let pixelFormat: image.PixelMapFormat = ndkTest.GetPixelmapPixelFormat(pixelmap);
          expect(pixelFormat == image.PixelMapFormat.RGBA_1010102).assertTrue();
          ndkTest.PixelMapRelease(pixelmap);
          done();
        } catch (err) {
          logger.log(`Test exception: ${JSON.stringify(err)}`);
          expect().assertFalse();
          done();
        }
      } else {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_0100
     * @tc.name      : CreatePixelMapWithARGB8888
     * @tc.desc      : Test create pixelmap when the format is ARGB_8888.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_0100");
        testCaseForDecodeARGBPixelMap(logger, done, supportedARGBDecodeFileList[0], ARGB_8888, true);
     })

    /*
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_0200
     * @tc.name      : CreatePixelMapWithARGB8888
     * @tc.desc      : Test create pixelmap when the format is ARGB_8888.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_0200");
      testCaseForDecodeARGBPixelMap(logger, done, supportedARGBDecodeFileList[1], ARGB_8888, true);
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_0300
     * @tc.name      : CreatePixelMapWithARGB8888
     * @tc.desc      : Test create pixelmap when the format is ARGB_8888.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_0300");
      testCaseForDecodeARGBPixelMap(logger, done, supportedARGBDecodeFileList[2], ARGB_8888, true);
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_0400
     * @tc.name      : CreatePixelMapWithARGB8888
     * @tc.desc      : Test create pixelmap when the format is ARGB_8888.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_0400");
      if (isSupportHdr) {
        testCaseForDecodeARGBPixelMap(logger, done, supportedARGBDecodeFileList[3], ARGB_8888, true);
      } else {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_0500
     * @tc.name      : CreatePixelMapWithARGB8888
     * @tc.desc      : Test create pixelmap when the format is ARGB_8888.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_0500");
      testCaseForDecodeARGBPixelMap(logger, done, supportedARGBDecodeFileList[4], ARGB_8888, true);
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_0600
     * @tc.name      : CreatePixelMapWithARGB8888
     * @tc.desc      : Test create pixelmap when the format is ARGB_8888.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_0600");
      testCaseForDecodeARGBPixelMap(logger, done, supportedARGBDecodeFileList[5], ARGB_8888, true);
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_0700
     * @tc.name      : CreatePixelMapWithARGB8888
     * @tc.desc      : Test create pixelmap when the format is ARGB_8888.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_0700");
      if (isSupportHdr) {
        testCaseForDecodeARGBPixelMap(logger, done, supportedARGBDecodeFileList[6], ARGB_8888, true);
      } else {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_0800
     * @tc.name      : CreatePixelMapWithARGB8888
     * @tc.desc      : Test create pixelmap when the format is ARGB_8888.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_0800");
      testCaseForDecodeARGBPixelMap(logger, done, supportedARGBDecodeFileList[7], ARGB_8888, true);
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_0900
     * @tc.name      : CreatePixelMapWithARGB8888
     * @tc.desc      : Test create pixelmap when the format is ARGB_8888.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_0900");
      if (isSupportHdr) {
        try {
          let inputPath: string = getFilePath(supportedARGBDecodeFileList[8]);
          let pixelmap: image.PixelMap = ndkTest.CreatePixelMapByImageSourceFromUri(inputPath, ARGB_8888, true, HDR, image.AllocatorType.DMA);
          expect(pixelmap != undefined).assertTrue();
          let pixelFormat: image.PixelMapFormat = ndkTest.GetPixelmapPixelFormat(pixelmap);
          expect(pixelFormat == image.PixelMapFormat.RGBA_1010102).assertTrue();
          ndkTest.PixelMapRelease(pixelmap);
          done();
        } catch (error) {
          logger.log(`Test exception: ${JSON.stringify(error)}`);
          expect().assertFalse();
          done();
        }
      } else {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_1000
     * @tc.name      : CreatePixelMapWithARGB8888
     * @tc.desc      : Test create pixelmap when the format is ARGB_8888.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_1000");
      testCaseForDecodeARGBPixelMap(logger, done, supportedARGBDecodeFileList[7], ARGB_8888, true, image.AllocatorType.AUTO);
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_ERROR_0100
     * @tc.name      : CreatePixelMapWithARGB8888
     * @tc.desc      : Test create pixelmap when the format is ARGB_8888.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_ERROR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_DECODE_ARGB_PIXELMAP_ALLOCATOR_ERROR_0100");
      try {
        let inputPath: string = getFilePath(supportedARGBDecodeFileList[0]);
        let result: ESObject = ndkTest.CreatePixelMapByImageSourceFromUri(inputPath, ARGB_8888, true, SDR, image.AllocatorType.DMA);
        logger.log("CreatePixelMapByImageSourceFromUri result is: " + result);
        expect(result == UNSUPPORTED_ALLOCATOR_TYPE).assertTrue();
        done();
      } catch (error) {
        logger.log(`Test exception: ${JSON.stringify(error)}`);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_ENCODE_ARGB_PIXELMAP_0100
     * @tc.name      : PackARGBPixelMap
     * @tc.desc      : Test packing pixelmap when the format is ARGB_8888.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_ENCODE_ARGB_PIXELMAP_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_ENCODE_ARGB_PIXELMAP_0100");
      let packOpt: image.PackingOption = testCreatePackOptions(supportedPackFormatList[0],
        98, image.PackingDynamicRange.AUTO, true);
      testCaseForEncodeARGBPixelMap(logger, done, packOpt, 'PackToData', false, supportedARGBDecodeFileList[0]);
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_ENCODE_ARGB_PIXELMAP_0200
     * @tc.name      : PackARGBPixelMap
     * @tc.desc      : Test packing pixelmap when the format is ARGB_8888.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_ENCODE_ARGB_PIXELMAP_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_ENCODE_ARGB_PIXELMAP_0200"); 
      let packOpt: image.PackingOption = testCreatePackOptions(supportedPackFormatList[1],
        98, image.PackingDynamicRange.AUTO, true);
      testCaseForEncodeARGBPixelMap(logger, done, packOpt, 'PackToData', false, supportedARGBDecodeFileList[1]);
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_ENCODE_ARGB_PIXELMAP_0300
     * @tc.name      : PackARGBPixelMap
     * @tc.desc      : Test packing pixelmap when the format is ARGB_8888.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_ENCODE_ARGB_PIXELMAP_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_ENCODE_ARGB_PIXELMAP_0300");
      if (!isSupportHeicEncode) {
        logger.log("device is not support heif encode");
        expect(true).assertTrue();
        done();
      } else {
        let packOpt: image.PackingOption = testCreatePackOptions(supportedPackFormatList[2],
          100, image.PackingDynamicRange.AUTO, true);
        testCaseForEncodeARGBPixelMap(logger, done, packOpt, 'PackToFile', false, supportedARGBDecodeFileList[7],
          "testArgb.heic");
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_ENCODE_ARGB_PIXELMAP_0400
     * @tc.name      : PackARGBPixelMap
     * @tc.desc      : Test packing pixelmap when the format is ARGB_8888.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_ENCODE_ARGB_PIXELMAP_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_ENCODE_ARGB_PIXELMAP_0400");
      let packOpt: image.PackingOption = testCreatePackOptions(supportedPackFormatList[3],
        98, image.PackingDynamicRange.AUTO, true);
      testCaseForEncodeARGBPixelMap(logger, done, packOpt, 'PackToFile', false, supportedARGBDecodeFileList[3],
        "testArgb.gif");
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_ENCODE_ARGB_PIXELMAP_0500
     * @tc.name      : PackARGBPixelMap
     * @tc.desc      : Test packing pixelmap when the format is ARGB_8888.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_ENCODE_ARGB_PIXELMAP_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_ENCODE_ARGB_PIXELMAP_0500");
      let packOpt: image.PackingOption = testCreatePackOptions(supportedPackFormatList[4],
        100, image.PackingDynamicRange.SDR, false);
      testCaseForEncodeARGBPixelMap(logger, done, packOpt, 'PackToFile', false, supportedARGBDecodeFileList[4],
        "testArgb.webp");
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_ENCODE_ARGB_PIXELMAP_ALLOCATOR_0100
     * @tc.name      : PackARGBPixelMap
     * @tc.desc      : Test packing pixelmap when the format is ARGB_8888.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_ENCODE_ARGB_PIXELMAP_ALLOCATOR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_ENCODE_ARGB_PIXELMAP_ALLOCATOR_0100");
      let packOpt: image.PackingOption = testCreatePackOptions(supportedPackFormatList[0],
        98, image.PackingDynamicRange.AUTO, true);
      testCaseForEncodeARGBPixelMap(logger, done, packOpt, 'PackToData', true, supportedARGBDecodeFileList[0]);
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_ENCODE_ARGB_PIXELMAP_ALLOCATOR_0200
     * @tc.name      : PackARGBPixelMap
     * @tc.desc      : Test packing pixelmap when the format is ARGB_8888.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_ENCODE_ARGB_PIXELMAP_ALLOCATOR_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_ENCODE_ARGB_PIXELMAP_ALLOCATOR_0200");
      let packOpt: image.PackingOption = testCreatePackOptions(supportedPackFormatList[1],
        98, image.PackingDynamicRange.AUTO, true);
      testCaseForEncodeARGBPixelMap(logger, done, packOpt, 'PackToData', true, supportedARGBDecodeFileList[1]);
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_ENCODE_ARGB_PIXELMAP_ALLOCATOR_0300
     * @tc.name      : PackARGBPixelMap
     * @tc.desc      : Test packing pixelmap when the format is ARGB_8888.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_ENCODE_ARGB_PIXELMAP_ALLOCATOR_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_ENCODE_ARGB_PIXELMAP_ALLOCATOR_0300");
      if (!isSupportHeicEncode) {
        logger.log("device is not support heif encode");
        expect(true).assertTrue();
        done();
      } else {
        let packOpt: image.PackingOption = testCreatePackOptions(supportedPackFormatList[2],
          100, image.PackingDynamicRange.AUTO, true);
        testCaseForEncodeARGBPixelMap(logger, done, packOpt, 'PackToFile', true, supportedARGBDecodeFileList[7],
          "test_pack_argb.heic");
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_ENCODE_ARGB_PIXELMAP_ALLOCATOR_0400
     * @tc.name      : PackARGBPixelMap
     * @tc.desc      : Test packing pixelmap when the format is ARGB_8888.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_ENCODE_ARGB_PIXELMAP_ALLOCATOR_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_ENCODE_ARGB_PIXELMAP_ALLOCATOR_0400");
      let packOpt: image.PackingOption = testCreatePackOptions(supportedPackFormatList[3],
        98, image.PackingDynamicRange.AUTO, true);
      testCaseForEncodeARGBPixelMap(logger, done, packOpt, 'PackToFile', true, supportedARGBDecodeFileList[3],
        "test_pack_argb.gif");
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_ENCODE_ARGB_PIXELMAP_ALLOCATOR_0500
     * @tc.name      : PackARGBPixelMap
     * @tc.desc      : Test packing pixelmap when the format is ARGB_8888.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_ENCODE_ARGB_PIXELMAP_ALLOCATOR_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAP_ENCODE_ARGB_PIXELMAP_ALLOCATOR_0500");
      let packOpt: image.PackingOption = testCreatePackOptions(supportedPackFormatList[4],
        100, image.PackingDynamicRange.SDR, false);
      testCaseForEncodeARGBPixelMap(logger, done, packOpt, 'PackToFile', true, supportedARGBDecodeFileList[4],
        "test_pack_argb.webp");
    })
  })
}