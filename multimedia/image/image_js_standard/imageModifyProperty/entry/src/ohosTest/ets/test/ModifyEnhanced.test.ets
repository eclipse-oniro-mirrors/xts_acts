/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import image from "@ohos.multimedia.image";
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import { BusinessError } from '@ohos.base';
import { common } from '@kit.AbilityKit';
import display from '@ohos.display';
import hdrCapability from '@ohos.graphics.hdrCapability';
import { readAndWritePropertyKeys, readAndWritePropertyKeyRules, errorKeyRules } from './SharedImageProperties.test'

let filesDir: string|undefined;
let testContext: common.UIAbilityContext;
let isSupportHEIFDecode: boolean;
let isSupportHdr: Boolean;
const DEFAULT_CODE = 0;
const UNSUPPORTED_MIMETYPE = 7700102;
const UNSUPPORTED_METADATA = 7700202;
const FAILED_TO_WRITE_PROPERTY = 7700304;
const TEST_ERROR_CASE1 = "error1.jpg";
const TEST_ERROR_CASE2 = "error2.jpg";
const TEST_ERROR_CASE3 = "error3.jpg";
const TEST_ERROR_CASE4 = "error4.jpg";
const TEST_ERROR_CASE6 = "error6.jpg";
const TEST_PROPERTY_JPEG = "test_exif_v2.jpg";
const TEST_PROPERTY_HEIC = "test_exif_v3.heic";
const TEST_PROPERTY_PNG  = "test_exif.png";
const TEST_PROPERTY_WEBP = "test_exif_v2.webp";
const TEST_WITHOUT_EXIF_JPEG    = "test_exif_empty.jpg";
const TEST_WITHOUT_EXIF_HEIC    = "test_exif_empty.heic";
const TEST_WITHOUT_EXIF_PNG     = "test_exif_empty.png";
const TEST_WITHOUT_EXIF_WEBP    = "test_exif_empty.webp";
const TEST_UNSUPPORTED_MIMETYPE = "test.ico";

class Logger {
  testNum: string;

  constructor(testNum: string) {
    this.testNum = testNum;
  }

  log(msg: string) {
    hilog.info(0x0000, "imageModifyPropertiesEnhanced", 'case: %{public}s msg:%{public}s', this.testNum, msg);
  }
}

function generateModifyRecords(
  logger: Logger,
  propertyKeys: Array<image.PropertyKey>,
  errorKeys: Array<image.PropertyKey> | undefined
): Record<string, string | null> {
  const modifyRecords: Record<string, string | null> = {} as Record<string, string | null>;

  propertyKeys.forEach((key) => {
    const rule = readAndWritePropertyKeyRules.get(key);

    if (!rule) {
      logger.log(`No rule found for key ${key}. Skipping generate.`);
      return;
    }

    if (errorKeys && errorKeys.includes(key)) {
      const errRule = errorKeyRules.get(key);
      if (errRule) {
        modifyRecords[String(key)] = errRule.modifyValue;
        logger.log(`Setting error value for key ${key}`);
      } else {
        logger.log(`No errRule found for key ${key}. Skipping.`);
      }
      return;
    }

    modifyRecords[String(key)] = rule.modifyValue;
  });

  return modifyRecords;
}

async function checkModifiedProperty(
  logger: Logger,
  filePath: string,
  propertyKeys: Array<image.PropertyKey>,
  errorKeys?: Array<image.PropertyKey>,
  errRecords?: Record<image.PropertyKey, string | null>
): Promise<boolean> {
  let dstRecords: Record<image.PropertyKey, string | null>;

  try {
    const imageSource = image.createImageSource(filePath);
    dstRecords = await imageSource.getImageProperties(propertyKeys);
    imageSource?.release();
  } catch (error) {
    logger.log("checkModifiedProperty error: " + JSON.stringify(error));
    return false;
  }

  const hasNoMismatch = propertyKeys.every((key) => {
    if (errorKeys?.includes(key) && errRecords) {
      logger.log(`originalValue: ${errRecords[key]}, actualValue: ${dstRecords[key]}`);
      logger.log(`checkModifiedProperty: validating error key ${key}, comparison result: ${dstRecords[key] == errRecords[key]}`);
      return dstRecords[key] == errRecords[key];
    }

    const rule = readAndWritePropertyKeyRules.get(key);
    if (!rule) {
      logger.log(`No rule found for key ${key}. Skipping validation.`);
      return true;
    }

    if (dstRecords[key] === rule.expectValue) {
      return true;
    }

    logger.log(`Mismatch for key ${key}: expectedValue=${rule.expectValue}, actualValue=${dstRecords[key]}`);
    return false;
  });

  logger.log("checkModifiedProperty completed, validation result: " + hasNoMismatch);
  return hasNoMismatch;
}

async function testModifyPropertiesEnhanced (
  logger: Logger,
  fileName: string,
  propertyKeys: Array<image.PropertyKey>,
  errorCode: number = DEFAULT_CODE,
  errorKeys?: Array<image.PropertyKey>
): Promise<boolean> {
  let records: Record<image.PropertyKey, string | null> | undefined;
  const modifyRecords = generateModifyRecords(logger, propertyKeys, errorKeys);
  let filePath = filesDir + "/" + fileName;
  let imageSource = image.createImageSource(filePath);
  try {
    if(errorKeys != undefined) {
      records = await imageSource.getImageProperties(errorKeys);
    }
    await imageSource.modifyImagePropertiesEnhanced(modifyRecords);
    let ret = await checkModifiedProperty(logger, filePath, propertyKeys);
    imageSource?.release();
    return ret;
  } catch (error) {
    imageSource?.release();
    logger.log(`testModifyPropertiesEnhanced error: ${JSON.stringify(error)}, message: ${error.message}`);
    if (errorCode == DEFAULT_CODE) {
      return false;
    }

    let ret = (error.code == errorCode);
    logger.log(`expected error code: ${errorCode}, actual error code: ${error.code}`);
    if (errorKeys != undefined && records) {
      logger.log("Partial failure detected. Continue to verify the normal keys.");
      ret = ret && await checkModifiedProperty(logger, filePath, propertyKeys, errorKeys, records);
    }
    return ret;
  }
};

export default function imageModifyPropertiesEnhanced() {
  describe("imageModifyPropertiesEnhanced", () => {

    beforeAll(async () => {
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      filesDir = AppStorage.get('pathDir');
      isSupportHEIFDecode =
        image.createImageSource(filesDir + '/' + "testExif.jpg").supportedFormats.includes("image/heic");
      isSupportHdr = 
        !display.getDefaultDisplaySync().hdrFormats.includes(hdrCapability.HDRFormat.NONE) &&
          display.getDefaultDisplaySync().hdrFormats.length != 0;
      console.info("beforeAll case");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_JPEG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_JPEG_0100
     * @tc.desc   test modifyImagePropertiesEnhanced
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_JPEG_0100", Level.LEVEL0, async (done: ()=> void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_JPEG_0100");
      let ret = await testModifyPropertiesEnhanced(logger, TEST_PROPERTY_JPEG, readAndWritePropertyKeys);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_HEIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_HEIC_0100
     * @tc.desc   test modifyImagePropertiesEnhanced
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_HEIC_0100", Level.LEVEL0, async (done: ()=> void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_HEIC_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      }
      let ret = await testModifyPropertiesEnhanced(logger, TEST_PROPERTY_HEIC, readAndWritePropertyKeys);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_PNG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_PNG_0100
     * @tc.desc   test modifyImagePropertiesEnhanced
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_PNG_0100", Level.LEVEL0, async (done: ()=> void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_PNG_0100");
      let ret = await testModifyPropertiesEnhanced(logger, TEST_PROPERTY_PNG, readAndWritePropertyKeys);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_WEBP_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_WEBP_0100
     * @tc.desc   test modifyImagePropertiesEnhanced
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_WEBP_0100", Level.LEVEL0, async (done: ()=> void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_WEBP_0100");
      let ret = await testModifyPropertiesEnhanced(logger, TEST_PROPERTY_WEBP, readAndWritePropertyKeys);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_WITHOUT_EXIF_JPEG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_WITHOUT_EXIF_JPEG_0100
     * @tc.desc   test modifyImagePropertiesEnhanced
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_WITHOUT_EXIF_JPEG_0100", Level.LEVEL0, async (done: ()=> void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_WITHOUT_EXIF_JPEG_0100");
      let ret = await testModifyPropertiesEnhanced(logger, TEST_WITHOUT_EXIF_JPEG, readAndWritePropertyKeys);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_WITHOUT_EXIF_HEIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_WITHOUT_EXIF_HEIC_0100
     * @tc.desc   test modifyImagePropertiesEnhanced
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_WITHOUT_EXIF_HEIC_0100", Level.LEVEL0, async (done: ()=> void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_WITHOUT_EXIF_HEIC_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      }
      let ret = await testModifyPropertiesEnhanced(logger, TEST_WITHOUT_EXIF_HEIC, readAndWritePropertyKeys);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_WITHOUT_EXIF_PNG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_WITHOUT_EXIF_PNG_0100
     * @tc.desc   test modifyImagePropertiesEnhanced
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_WITHOUT_EXIF_PNG_0100", Level.LEVEL0, async (done: ()=> void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_WITHOUT_EXIF_PNG_0100");
      let ret = await testModifyPropertiesEnhanced(logger, TEST_WITHOUT_EXIF_PNG, readAndWritePropertyKeys);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_WITHOUT_EXIF_WEBP_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_WITHOUT_EXIF_WEBP_0100
     * @tc.desc   test modifyImagePropertiesEnhanced
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_WITHOUT_EXIF_WEBP_0100", Level.LEVEL0, async (done: ()=> void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_WITHOUT_EXIF_WEBP_0100");
      let ret = await testModifyPropertiesEnhanced(logger, TEST_WITHOUT_EXIF_WEBP, readAndWritePropertyKeys);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_JPEG_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_JPEG_ERROR_0100
     * @tc.desc   test modifyImagePropertiesEnhanced error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_JPEG_ERROR_0100", Level.LEVEL0, async (done: ()=> void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_JPEG_ERROR_0100");
      const errorKeys: Array<image.PropertyKey> = [
          image.PropertyKey.PHOTO_MODE,
          image.PropertyKey.ORIENTATION,
          image.PropertyKey.IMAGE_WIDTH,
          image.PropertyKey.GPS_SPEED_REF
        ]
      let ret = await testModifyPropertiesEnhanced(logger, TEST_ERROR_CASE1, readAndWritePropertyKeys, UNSUPPORTED_METADATA, errorKeys);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_JPEG_ERROR_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_JPEG_ERROR_0200
     * @tc.desc   test modifyImagePropertiesEnhanced error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_JPEG_ERROR_0200", Level.LEVEL0, async (done: ()=> void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_JPEG_ERROR_0200");
      let filePath = filesDir + "/" + TEST_ERROR_CASE2;
      let beforeImageSource = image.createImageSource(filePath);
      try {
        let modifyRecords: Record<string, string | null> = {
          "ImageWidth": "1024",
          "xyz": "2025",
          "ImageLength": "2048",
          "Orientation": "Top-left",
          "RowsPerStrip": "10",
          "error": "xxx"
        } as Record<string, string | null>;
        await beforeImageSource.modifyImagePropertiesEnhanced(modifyRecords);
        logger.log("modifyImagePropertiesEnhanced end!!!");
        beforeImageSource?.release();
        expect().assertFail();
        done();
      } catch (error) {
        beforeImageSource?.release();
        logger.log(`modifyImagePropertiesEnhanced error: ${JSON.stringify(error)}, message: ${error.message}!`);
        expect(error.code == UNSUPPORTED_METADATA).assertTrue();
        let imageSource = image.createImageSource(filePath);
        let dstRecords = await imageSource.getImageProperties([
          image.PropertyKey.IMAGE_WIDTH,
          image.PropertyKey.IMAGE_LENGTH,
          image.PropertyKey.ORIENTATION,
          image.PropertyKey.ROWS_PER_STRIP
        ]);
        imageSource?.release();
        let ret = dstRecords[image.PropertyKey.IMAGE_WIDTH]  == '1024' &&
                  dstRecords[image.PropertyKey.IMAGE_LENGTH] == '2048' &&
                  dstRecords[image.PropertyKey.ORIENTATION]  == 'Top-left' &&
                  dstRecords[image.PropertyKey.ROWS_PER_STRIP] == '10';
        logger.log(`Partial modification result verification: ${ret}`);
        expect(ret).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_JPEG_ERROR_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_JPEG_ERROR_0300
     * @tc.desc   test modifyImagePropertiesEnhanced error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_JPEG_ERROR_0300", Level.LEVEL0, async (done: ()=> void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_JPEG_ERROR_0300");
      let filePath = filesDir + "/" + TEST_ERROR_CASE3;
      let beforeImageSource = image.createImageSource(filePath);
      try {
        let modifyRecords: Record<string, string | null> = {
          "xyz": "2025"
        } as Record<string, string | null>;
        await beforeImageSource.modifyImagePropertiesEnhanced(modifyRecords);
        logger.log("modifyImagePropertiesEnhanced end!!!");
        beforeImageSource?.release();
        expect().assertFail();
        done();
      } catch (error) {
        beforeImageSource?.release();
        logger.log(`modifyImagePropertiesEnhanced error: ${JSON.stringify(error)}, message: ${error.message}!`);
        expect(error.code == UNSUPPORTED_METADATA).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_JPEG_ERROR_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_JPEG_ERROR_0400
     * @tc.desc   test modifyImagePropertiesEnhanced error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_JPEG_ERROR_0400", Level.LEVEL0, async (done: ()=> void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_JPEG_ERROR_0400");
      let filePath = filesDir + "/" + TEST_ERROR_CASE4;
      let beforeImageSource = image.createImageSource(filePath);
      try {
        let modifyRecords: Record<string, string | null> = {} as Record<string, string | null>;
        modifyRecords[String(image.PropertyKey.GIF_LOOP_COUNT)] = "1024";
        await beforeImageSource.modifyImagePropertiesEnhanced(modifyRecords);
        logger.log("modifyImagePropertiesEnhanced end!!!");
        beforeImageSource?.release();
        expect().assertFail();
        done();
      } catch (error) {
        beforeImageSource?.release();
        logger.log(`modifyImagePropertiesEnhanced error: ${JSON.stringify(error)}, message: ${error.message}!`);
        expect(error.code == UNSUPPORTED_METADATA).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_JPEG_ERROR_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_JPEG_ERROR_0500
     * @tc.desc   test modifyImagePropertiesEnhanced error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_JPEG_ERROR_0500", Level.LEVEL0, async (done: ()=> void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_JPEG_ERROR_0500");
      let filePath = filesDir + "/" + TEST_UNSUPPORTED_MIMETYPE;
      let beforeImageSource = image.createImageSource(filePath);
      try {
        let modifyRecords: Record<string, string | null> = {} as Record<string, string | null>;
        modifyRecords[String(image.PropertyKey.IMAGE_WIDTH)]  = '1024';
        modifyRecords[String(image.PropertyKey.IMAGE_LENGTH)] = '1024';
        await beforeImageSource.modifyImagePropertiesEnhanced(modifyRecords);
        logger.log("modifyImagePropertiesEnhanced end!!!");
        beforeImageSource?.release();
        expect().assertFail();
        done();
      } catch (error) {
        beforeImageSource?.release();
        logger.log(`modifyImagePropertiesEnhanced error: ${JSON.stringify(error)}, message: ${error.message}!`);
        expect(error.code == UNSUPPORTED_MIMETYPE).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_JPEG_ERROR_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_JPEG_ERROR_0600
     * @tc.desc   test modifyImagePropertiesEnhanced error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_JPEG_ERROR_0600", Level.LEVEL0, async (done: ()=> void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_MODIFY_PROPERTY_ENHANCED_JPEG_ERROR_0600");
      let filePath = filesDir + "/" + TEST_ERROR_CASE6;
      let imageSource = image.createImageSource(filePath);
      try {
        let modifyRecords: Record<string, string | null> = {} as Record<string, string | null>;
        modifyRecords[String(image.PropertyKey.IMAGE_WIDTH)]  = '1024';
        modifyRecords[String(image.PropertyKey.IMAGE_LENGTH)] = '1024';
        imageSource?.release();
        await imageSource.modifyImagePropertiesEnhanced(modifyRecords);
        logger.log("modifyImagePropertiesEnhanced end!!!");
        expect().assertFail();
        done();
      } catch (error) {
        imageSource?.release();
        logger.log(`modifyImagePropertiesEnhanced error: ${JSON.stringify(error)}, message: ${error.message}!`);
        expect(error.code == FAILED_TO_WRITE_PROPERTY).assertTrue();
        done();
      }
    });
  });
}
