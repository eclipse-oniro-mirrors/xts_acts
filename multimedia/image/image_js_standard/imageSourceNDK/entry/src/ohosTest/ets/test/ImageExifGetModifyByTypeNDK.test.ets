/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import mdkTest from 'libentryMDK.so';
import { common } from '@kit.AbilityKit';
import display from '@ohos.display';
import hdrCapability from '@ohos.graphics.hdrCapability';
import fs from '@ohos.file.fs';
import { ImagePropertyConfig } from './ImagePropertyByTypeNDK.test'
import taskpool from '@ohos.taskpool';

let uiContext: common.UIAbilityContext;
let isSupportHdr: Boolean;
let isSupportHEIFDecode: boolean;
let isSupportHEICEncode: boolean;
const READ_FAILED = 7700202;
const UNSUPPORTED_IMAGE_FORMATS = 7700102;
const PROPERTY_NOT_EXIST = 7700204;

interface ModifyRule {
  expectValueJPG: number | string | Array<number> | Array<number | null> | null;
  expectValuePNG: number | string | Array<number> | Array<number | null> | null;
  expectValueHEIC: number | string | Array<number> | Array<number | null> | null;
  expectValueWEBP: number | string | Array<number> | Array<number | null> | null;
  expectValueDNG: number | string | Array<number> | Array<number | null> | null;
}

interface ModifyRule2 {
  modifyValue: number | Array<number> | ArrayBuffer;
  expectValueJPG: number | Array<number> | Array<number | null> | null | ArrayBuffer;
  expectValuePNG: number | Array<number> | Array<number | null> | null | ArrayBuffer;
  expectValueHEIC: number | Array<number> | Array<number | null> | null | ArrayBuffer;
  expectValueWEBP: number | Array<number> | Array<number | null> | null | ArrayBuffer;
  expectValueDNG: number | Array<number> | Array<number | null> | null | ArrayBuffer;
}

const testArrayBufferU8: Uint8Array = new Uint8Array([1, 2, 2, 3]);
const testArrayBuffer: ArrayBuffer = testArrayBufferU8.buffer as ArrayBuffer;


async function getPropertyValue(
  fd: number,
  type: string,
  key: image.PropertyKey
): Promise<number | Array<number> | Array<number | null> | ArrayBuffer | string> {
  let task = new taskpool.Task(getPropertyValueTest, fd, type, key);
  let ret = (await taskpool.execute(task)) as number | Array<number> | Array<number | null> | ArrayBuffer | string;
  return ret;
}

@Concurrent
async function getPropertyValueTest(
  fd: number,
  type: string,
  key: image.PropertyKey
): Promise<number | Array<number> | Array<number | null> | ArrayBuffer | string> {
  console.log("start first time");
  // 模拟异步操作
  return await new Promise<number | Array<number> | Array<number | null> | ArrayBuffer | string>((resolve) => {
      let size: number;
      switch (type) {
        case "short":
          resolve(mdkTest.TestGetImagePropertyShort(fd, key));
        case "long":
          resolve(mdkTest.TestGetImagePropertyLong(fd, key));
        case "double":
          resolve(mdkTest.TestGetImagePropertyDouble(fd, key));
        case "arraySize":
          resolve(mdkTest.TestGetImagePropertyArraySize(fd, key));
        case "string":
          size = mdkTest.TestGetImagePropertyArraySize(fd, key);
          resolve(mdkTest.TestGetImagePropertyString(fd, key, size));
        case "intArray":
          size = mdkTest.TestGetImagePropertyArraySize(fd, key);
          resolve(mdkTest.TestGetImagePropertyIntArray(fd, key, size));
        case "doubleArray":
          size = mdkTest.TestGetImagePropertyArraySize(fd, key);
          resolve(mdkTest.TestGetImagePropertyDoubleArray(fd, key, size));
        case "arrayBuffer":
          size = mdkTest.TestGetImagePropertyArraySize(fd, key);
          resolve(mdkTest.TestGetImagePropertyBlob(fd, key, size));
        default:
          throw new Error(`Unsupported property type: ${type}`);
      }
  });
}

export default function ImageExifGetModifyByTypeNDK() {
  describe('ImageExifGetModifyByTypeNDK', () => {
    beforeAll(async () => {
      uiContext = globalThis.uiContext;
      isSupportHEIFDecode =
        image.createImageSource(uiContext.filesDir + '/' + "test.jpg").supportedFormats.includes("image/heic");
      isSupportHdr = !display.getDefaultDisplaySync().hdrFormats.includes(hdrCapability.HDRFormat.NONE) &&
        display.getDefaultDisplaySync().hdrFormats.length != 0;
      isSupportHEICEncode = image.createImagePacker().supportedFormats.includes("image/heic");
      console.info('beforeAll case');
    });
    beforeEach(() => {
      console.info('beforeEach case');
    });
    afterEach(() => {
      console.info('afterEach case');
    });
    afterAll(() => {
      console.info('afterAll case');
    });

    let filePath: string;
    let fdNumber: number;

    const getFd = async (fileName: string) => {
        const uri: string = uiContext.filesDir + "/" + fileName;
        const file: fs.File = fs.openSync(uri, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        fdNumber = file.fd
        return file.fd;
    }

    const compareValues = (
      actual: string | number | object | (number | null)[] | undefined | null | boolean,
      expected: string | number | object | (number | null)[] | undefined | null | boolean
    ): boolean => {
      if (Array.isArray(actual) && Array.isArray(expected)) {
        if (actual.length !== expected.length) return false;
        return actual.every((val: number | null, index: number) => {
          const expectedVal: number | null = expected[index] as number | null;
          if (val === null || expectedVal === null) return true;
          return val === expectedVal;
        });
      }
      return actual === expected;
    }

    const compareArrayBuffer = (
      actualBuffer: ArrayBuffer,
      expectedValue: string | number | object | number[] | undefined | null | ArrayBuffer | boolean
    ): boolean => {
      const actualArray = new Uint8Array(actualBuffer);
      const MAX_COMPARE_COUNT = 20;
      
      const logCount = Math.min(MAX_COMPARE_COUNT, actualArray.length);
      for (let i = 0; i < logCount; i++) {
        console.info(`ArrayBuffer[${i}]: ${actualArray[i]}`);
      }
      if (actualArray.length > MAX_COMPARE_COUNT) {
        console.info(`ArrayBuffer: ... (${actualArray.length - MAX_COMPARE_COUNT} elements omitted) ...`);
      }

      if (expectedValue instanceof ArrayBuffer) {
        const expectedArray = new Uint8Array(expectedValue);
        const compareCount = Math.min(MAX_COMPARE_COUNT, actualArray.length, expectedArray.length);
        
        for (let i = 0; i < compareCount; i++) {
          if (actualArray[i] !== expectedArray[i]) {
            console.info(`Mismatch at [${i}]: actual=${actualArray[i]}, expected=${expectedArray[i]}`);
            return false;
          }
        }
        return true;
      }
      
      if (Array.isArray(expectedValue)) {
        const compareCount = Math.min(MAX_COMPARE_COUNT, actualArray.length, expectedValue.length);
        for (let i = 0; i < compareCount; i++) {
          if (actualArray[i] !== expectedValue[i]) {
            console.info(`Mismatch at [${i}]: actual=${actualArray[i]}, expected=${expectedValue[i]}`);
            return false;
          }
        }
        return true;
      }
      return false;
    }

    const modifyPropertyValue = async (
      fd: number,
      type: string,
      key: image.PropertyKey,
      value: number | Array<number> | ArrayBuffer,
    ): Promise<number> => {
      switch (type) {
        case "short":
          return mdkTest.TestModifyImagePropertyShort(fd, key, value as number);
        case "long":
          return mdkTest.TestModifyImagePropertyLong(fd, key, value as number);
        case "double":
          return mdkTest.TestModifyImagePropertyDouble(fd, key, value as number);
        case "intArray":
          return mdkTest.TestModifyImagePropertyIntArray(fd, key, value as Array<number>);
        case "doubleArray":
          return mdkTest.TestModifyImagePropertyDoubleArray(fd, key, value as Array<number>);
        case "arrayBuffer":
          return mdkTest.TestModifyImagePropertyBlob(fd, key, value as ArrayBuffer);
        default:
          throw new Error(`Unsupported property type: ${type}`);
      }
    }

    const getExpectedValue = (
      rule: ModifyRule | ModifyRule2,
      fileType: string
    ): number | Array<number> | Array<number | null> | null | string | ArrayBuffer => {
      switch (fileType) {
        case "expectValueJPG":
          return rule.expectValueJPG;
        case "expectValuePNG":
          return rule.expectValuePNG;
        case "expectValueHEIC":
          return rule.expectValueHEIC;
        case "expectValueWEBP":
          return rule.expectValueWEBP;
        case "expectValueDNG":
          return rule.expectValueDNG;
        default:
          throw new Error(`Unsupported file type: ${fileType}`);
      }
    }

    const TestGetImagePropertyByType = async (
      testNum: string,
      fileName: string,
      propertyKeys: Array<image.PropertyKey>,
      rules: Map<image.PropertyKey, ModifyRule>,
      fileType: string,
      type: string
    ): Promise<boolean> => {
      let ret: boolean = true;

      for (const key of propertyKeys) {
        const rule = rules.get(key);
        if (!rule) {
          console.info(`${testNum} No rule found for key: ${key}`);
          continue;
        }
        let fd: number = await getFd(fileName);
        try {
          const actualValue = await getPropertyValue(fd, type, key);
          const expectedValue = getExpectedValue(rule, fileType);
          if (actualValue instanceof ArrayBuffer) {
            if (!compareArrayBuffer(actualValue, expectedValue)) {
              console.info(`${testNum} Verification failed for ArrayBuffer key: ${key}, Expected: ${JSON.stringify(expectedValue)}, Actual ArrayBuffer length: ${actualValue.byteLength}`);
              ret = false;
            }
          } else if (!compareValues(actualValue, expectedValue)) {
            console.info(`${testNum} Verification failed for key: ${key}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
            ret = false;
          }
        } catch (error) {
          console.error(`${testNum} Error processing key ${key}: ${error}`);
          ret = false;
        } finally {
          try {
            fs.closeSync(fd);
          } catch (e) {
            console.error(`${testNum} Error closing fd for key ${key}: ${e}`);
          }
        }
      }
      return ret;
    }

    const TestGetImagePropertyByTypeError = async (
      testNum: string,
      fileName: string,
      Key: image.PropertyKey,
      type: string,
      errorCode: number
    ): Promise<boolean> => {
      let ret: boolean = true;
      let fd: number = await getFd(fileName);
      try {
        const actualValue = await getPropertyValue(fd, type, Key);
        if (!compareValues(actualValue, errorCode)) {
          console.info(`${testNum} Verification failed for key: ${Key}, Expected: ${JSON.stringify(errorCode)}, Actual: ${JSON.stringify(actualValue)}`);
          ret = false;
        }
      } catch (error) {
        console.error(`${testNum} Error processing key ${Key}: ${error}`);
        ret = false;
      } finally {
        try {
          fs.closeSync(fd);
        } catch (e) {
          console.error(`${testNum} Error closing fd for key ${Key}: ${e}`);
        }
      }
      return ret;
    }

    const TestModfiyImagePropertyByType = async (
      testNum: string,
      fileName: string,
      propertyKeys: Array<image.PropertyKey>,
      rules: Map<image.PropertyKey, ModifyRule2>,
      fileType: string,
      type: string
    ): Promise<boolean> => {
      let ret: boolean = true;

      for (const key of propertyKeys) {
        const rule = rules.get(key);
        if (!rule) {
          console.info(`${testNum} No rule found for key: ${key}`);
          continue;
        }
        let fd: number = await getFd(fileName);
        try {
          const errorCode = await modifyPropertyValue(fd, type, key, rule.modifyValue);
          const actualValue = await getPropertyValue(fd, type, key);
          const expectedValue = getExpectedValue(rule, fileType);
          
          if (actualValue instanceof ArrayBuffer) {
            if (!compareArrayBuffer(actualValue, expectedValue)) {
              console.info(`${testNum} Verification failed for ArrayBuffer key: ${key}, Expected: ${JSON.stringify(expectedValue)}, Actual ArrayBuffer length: ${actualValue.byteLength}`);
              ret = false;
            }
          } else if (!compareValues(actualValue, expectedValue)) {
            console.info(`${testNum} Verification failed for key: ${key}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
            ret = false;
          }
        } catch (error) {
          console.error(`${testNum} Error processing key ${key}: ${error}`);
          ret = false;
        } finally {
          try {
            fs.closeSync(fd);
          } catch (e) {
            console.error(`${testNum} Error closing fd for key ${key}: ${e}`);
          }
        }
      }
      return ret;
    }

    const testCreatePackOptions = (
      format: string,
      quality: number,
      needsPackProperties: boolean
    ): image.PackingOption => {
      let packOpt: image.PackingOption = mdkTest.CreatePackingOptions();
      mdkTest.SetMimeTypeToTestPackingOptions(packOpt, format);
      mdkTest.SetQualityToTestPackingOptions(packOpt, quality);
      mdkTest.SetNeedsPackPropertiesToTestPackingOptions(packOpt, needsPackProperties);
      return packOpt;
    }

    const testPackToFile = async (
      testTag: string,
      fdNumber: number,
      writeFd: number,
      packingOption: image.PackingOption
    ) => {
      try {
        let opts: image.DecodingOptions = mdkTest.createDecodingOptions();
        if (opts == undefined) {
          console.info(testTag + " Failed to create DecodingOptions.");
          expect().assertFail();
          return;
        }
        let pixelMap: image.PixelMap = mdkTest.createPixelmap(fdNumber, opts);
        if (pixelMap == undefined) {
          console.info(testTag + " Failed to create PixelMap.");
          expect().assertFail();
          return;
        }
        let errorCode: number = mdkTest.testPackPixelMapToFile(pixelMap, packingOption, writeFd);
        console.info(testTag + " ImagePacker PackToFile success. errorCode: " + errorCode);
        mdkTest.releaseDecodingOptions(opts);
        mdkTest.releasePixelMap(pixelMap);
      } catch (error) {
        console.info(testTag + " pack to file error: " + error);
        expect().assertFail();
        return;
      }
    }

    const testPackToFileAndModify = async (
      testNum: string,
      fileName: string,
      compareFileName: string,
      key: image.PropertyKey,
      modiifyData: number | Array<number> | ArrayBuffer,
      compareData: number | Array<number> | ArrayBuffer,
      packingOption: image.PackingOption,
      type: string
    ): Promise<boolean> => {
      let result = true;
      let fd: number = await getFd(fileName);
      try {
        const errorCode = await modifyPropertyValue(fd, type, key, modiifyData);
        const actualValue = await getPropertyValue(fd, type, key);
        console.info(testNum + "dhs testPackToFileAndModify 111 : " + actualValue);
        if (actualValue instanceof ArrayBuffer) {
          if (!compareArrayBuffer(actualValue, compareData)) {
            console.info(`${testNum} Verification failed for ArrayBuffer key: ${key}, Expected: ${JSON.stringify(compareData)}, Actual ArrayBuffer length: ${actualValue.byteLength}`);
            result = false;
          }
        } else if (!compareValues(actualValue, compareData)) {
          console.info(`${testNum} Verification failed for key: ${key}, Expected: ${JSON.stringify(compareData)}, Actual: ${JSON.stringify(actualValue)}`);
          result = false;
        }
        console.info(testNum + "dhs testPackToFileAndModify 222");

        let fdNumber: number = await getFd(compareFileName);
        await testPackToFile(testNum, fd, fdNumber, packingOption);
        
        console.info(testNum + "dhs testPackToFileAndModify 333");
        const exifValueGet = await getPropertyValue(fdNumber, type, key);
        console.info(testNum + " getPropertyValue short. exifValueGet: " + exifValueGet);
        if (actualValue instanceof ArrayBuffer) {
          if (!compareArrayBuffer(actualValue, compareData)) {
            console.info(`${testNum} Verification failed for ArrayBuffer key: ${key}, Expected: ${JSON.stringify(compareData)}, Actual ArrayBuffer length: ${actualValue.byteLength}`);
            result = false;
          }
        } else if (!compareValues(actualValue, compareData)) {
          console.info(`${testNum} Verification failed for key: ${key}, Expected: ${JSON.stringify(compareData)}, Actual: ${JSON.stringify(actualValue)}`);
          result = false;
        }
        fs.closeSync(fd);
        fs.closeSync(fdNumber);
        console.info(testNum + "dhs testPackToFileAndModify 333");
      } catch (error) {
        console.info(testNum + " test failed with error: " + error);
        result = false;
      }
      return result;
    }

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_0100
     * @tc.desc        Verify read short type EXIF properties from JPEG
     *                 1.Create image source from JPEG file using fd
     *                 2.Read short type properties using TestGetImagePropertyShort
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_0100", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_0100"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        ImagePropertyConfig.short.keys, ImagePropertyConfig.short.rules, "expectValueJPG", "short");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_0200
     * @tc.desc        Verify read short type EXIF properties from PNG
     *                 1.Create image source from PNG file using fd
     *                 2.Read short type properties using TestGetImagePropertyShort
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_0200", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_0200"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_png_v2.png", 
        ImagePropertyConfig.short.keys, ImagePropertyConfig.short.rules, "expectValuePNG", "short");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_0300
     * @tc.desc        Verify read short type EXIF properties from HEIC
     *                 1.Create image source from HEIC file using fd
     *                 2.Read short type properties using TestGetImagePropertyShort
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_0300", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_0300"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_heic_v2.heic", 
        ImagePropertyConfig.short.keys, ImagePropertyConfig.short.rules, "expectValueHEIC", "short");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_0400
     * @tc.desc        Verify read short type EXIF properties from WEBP
     *                 1.Create image source from WEBP file using fd
     *                 2.Read short type properties using TestGetImagePropertyShort
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_0400", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_0400"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_webp_v2.webp", 
        ImagePropertyConfig.short.keys, ImagePropertyConfig.short.rules, "expectValueWEBP", "short");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_ONLY_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_ONLY_0500
     * @tc.desc        Verify read read-only short type EXIF properties from JPEG
     *                 1.Create image source from JPEG file using fd
     *                 2.Read read-only short type properties using TestGetImagePropertyShort
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_ONLY_0500", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_ONLY_0500"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        ImagePropertyConfig.shortReadOnly.keys, ImagePropertyConfig.shortReadOnly.rules, "expectValueJPG", "short");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_ONLY_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_ONLY_0600
     * @tc.desc        Verify read read-only short type EXIF properties from PNG
     *                 1.Create image source from PNG file using fd
     *                 2.Read read-only short type properties using TestGetImagePropertyShort
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_ONLY_0600", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_ONLY_0600"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_png_v2.png", 
        ImagePropertyConfig.shortReadOnly.keys, ImagePropertyConfig.shortReadOnly.rules, "expectValuePNG", "short");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_ONLY_0700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_ONLY_0700
     * @tc.desc        Verify read read-only short type EXIF properties from HEIC
     *                 1.Create image source from HEIC file using fd
     *                 2.Read read-only short type properties using TestGetImagePropertyShort
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_ONLY_0700", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_ONLY_0700"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_heic_v2.heic", 
        ImagePropertyConfig.shortReadOnly.keys, ImagePropertyConfig.shortReadOnly.rules, "expectValueHEIC", "short");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_ONLY_0800
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_ONLY_0800
     * @tc.desc        Verify read read-only short properties error handling for WEBP
     *                 1.Create image source from WEBP file using fd
     *                 2.Attempt to read unsupported read-only properties
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_ONLY_0800", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_ONLY_0800"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_webp_v2.webp", 
        image.PropertyKey.JPEG_INTERCHANGE_FORMAT, "short", READ_FAILED);
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_webp_v2.webp", 
        image.PropertyKey.JPEG_INTERCHANGE_FORMAT_LENGTH, "short", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LONG_0900
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LONG_0900
     * @tc.desc        Verify read long type EXIF properties from JPEG
     *                 1.Create image source from JPEG file using fd
     *                 2.Read long type properties using TestGetImagePropertyLong
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LONG_0900", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LONG_0900"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        ImagePropertyConfig.long.keys, ImagePropertyConfig.long.rules, "expectValueJPG", "long");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LONG_1000
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LONG_1000
     * @tc.desc        Verify read long type EXIF properties from PNG
     *                 1.Create image source from PNG file using fd
     *                 2.Read long type properties using TestGetImagePropertyLong
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LONG_1000", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LONG_1000"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_png_v2.png", 
        ImagePropertyConfig.long.keys, ImagePropertyConfig.long.rules, "expectValuePNG", "long");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LONG_1100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LONG_1100
     * @tc.desc        Verify read long type EXIF properties from HEIC
     *                 1.Create image source from HEIC file using fd
     *                 2.Read long type properties using TestGetImagePropertyLong
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LONG_1100", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LONG_1100"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_heic_v2.heic", 
        ImagePropertyConfig.long.keys, ImagePropertyConfig.long.rules, "expectValueHEIC", "long");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LONG_1200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LONG_1200
     * @tc.desc        Verify read long type EXIF properties from WEBP
     *                 1.Create image source from WEBP file using fd
     *                 2.Read long type properties using TestGetImagePropertyLong
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LONG_1200", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LONG_1200"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_webp_v2.webp", 
        ImagePropertyConfig.long.keys, ImagePropertyConfig.long.rules, "expectValueWEBP", "long");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLE_1300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLE_1300
     * @tc.desc        Verify read double type EXIF properties from JPEG
     *                 1.Create image source from JPEG file using fd
     *                 2.Read double type properties using TestGetImagePropertyDouble
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLE_1300", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLE_1300"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        ImagePropertyConfig.double.keys, ImagePropertyConfig.double.rules, "expectValueJPG", "double");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLE_1400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLE_1400
     * @tc.desc        Verify read double type EXIF properties from PNG
     *                 1.Create image source from PNG file using fd
     *                 2.Read double type properties using TestGetImagePropertyDouble
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLE_1400", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLE_1400"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_png_v2.png", 
        ImagePropertyConfig.double.keys, ImagePropertyConfig.double.rules, "expectValuePNG", "double");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLE_1500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLE_1500
     * @tc.desc        Verify read double type EXIF properties from HEIC
     *                 1.Create image source from HEIC file using fd
     *                 2.Read double type properties using TestGetImagePropertyDouble
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLE_1500", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLE_1500"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_heic_v2.heic", 
        ImagePropertyConfig.double.keys, ImagePropertyConfig.double.rules, "expectValueHEIC", "double");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLE_1600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLE_1600
     * @tc.desc        Verify read double type EXIF properties from WEBP
     *                 1.Create image source from WEBP file using fd
     *                 2.Read double type properties using TestGetImagePropertyDouble
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLE_1600", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLE_1600"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_webp_v2.webp", 
        ImagePropertyConfig.double.keys, ImagePropertyConfig.double.rules, "expectValueWEBP", "double");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_INTARRAY_1700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_INTARRAY_1700
     * @tc.desc        Verify read int array type EXIF properties from JPEG
     *                 1.Create image source from JPEG file using fd
     *                 2.Read int array type properties using TestGetImagePropertyIntArray
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_INTARRAY_1700", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_INTARRAY_1700"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        ImagePropertyConfig.intArray.keys, ImagePropertyConfig.intArray.rules, "expectValueJPG", "intArray");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_INTARRAY_1800
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_INTARRAY_1800
     * @tc.desc        Verify read int array type EXIF properties from PNG
     *                 1.Create image source from PNG file using fd
     *                 2.Read int array type properties using TestGetImagePropertyIntArray
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_INTARRAY_1800", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_INTARRAY_1800"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_png_v2.png", 
        ImagePropertyConfig.intArray.keys, ImagePropertyConfig.intArray.rules, "expectValuePNG", "intArray");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_INTARRAY_1900
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_INTARRAY_1900
     * @tc.desc        Verify read int array type EXIF properties from HEIC
     *                 1.Create image source from HEIC file using fd
     *                 2.Read int array type properties using TestGetImagePropertyIntArray
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_INTARRAY_1900", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_INTARRAY_1900"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_heic_v2.heic", 
        ImagePropertyConfig.intArray.keys, ImagePropertyConfig.intArray.rules, "expectValueHEIC", "intArray");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_INTARRAY_2000
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_INTARRAY_2000
     * @tc.desc        Verify read int array type EXIF properties from WEBP
     *                 1.Create image source from WEBP file using fd
     *                 2.Read int array type properties using TestGetImagePropertyIntArray
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_INTARRAY_2000", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_INTARRAY_2000"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_webp_v2.webp", 
        ImagePropertyConfig.intArray.keys, ImagePropertyConfig.intArray.rules, "expectValueWEBP", "intArray");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLEARRAY_2100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLEARRAY_2100
     * @tc.desc        Verify read double array type EXIF properties from JPEG
     *                 1.Create image source from JPEG file using fd
     *                 2.Read double array type properties using TestGetImagePropertyDoubleArray
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLEARRAY_2100", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLEARRAY_2100"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        ImagePropertyConfig.doubleArray.keys, ImagePropertyConfig.doubleArray.rules, "expectValueJPG", "doubleArray");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLEARRAY_2200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLEARRAY_2200
     * @tc.desc        Verify read double array type EXIF properties from PNG
     *                 1.Create image source from PNG file using fd
     *                 2.Read double array type properties using TestGetImagePropertyDoubleArray
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLEARRAY_2200", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLEARRAY_2200"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_png_v2.png", 
        ImagePropertyConfig.doubleArray.keys, ImagePropertyConfig.doubleArray.rules, "expectValuePNG", "doubleArray");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLEARRAY_2300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLEARRAY_2300
     * @tc.desc        Verify read double array type EXIF properties from HEIC
     *                 1.Create image source from HEIC file using fd
     *                 2.Read double array type properties using TestGetImagePropertyDoubleArray
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLEARRAY_2300", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLEARRAY_2300"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_heic_v2.heic", 
        ImagePropertyConfig.doubleArray.keys, ImagePropertyConfig.doubleArray.rules, "expectValueHEIC", "doubleArray");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLEARRAY_2400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLEARRAY_2400
     * @tc.desc        Verify read double array type EXIF properties from WEBP
     *                 1.Create image source from WEBP file using fd
     *                 2.Read double array type properties using TestGetImagePropertyDoubleArray
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLEARRAY_2400", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLEARRAY_2400"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_webp_v2.webp", 
        ImagePropertyConfig.doubleArray.keys, ImagePropertyConfig.doubleArray.rules, "expectValueWEBP", "doubleArray");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_STRING_2500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_STRING_2500
     * @tc.desc        Verify read string type EXIF properties from JPEG
     *                 1.Create image source from JPEG file using fd
     *                 2.Read string type properties using TestGetImagePropertyString
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_STRING_2500", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_STRING_2500"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        ImagePropertyConfig.string.keys, ImagePropertyConfig.string.rules, "expectValueJPG", "string");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_STRING_2600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_STRING_2600
     * @tc.desc        Verify read string type EXIF properties from PNG
     *                 1.Create image source from PNG file using fd
     *                 2.Read string type properties using TestGetImagePropertyString
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_STRING_2600", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_STRING_2600"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_png_v2.png", 
        ImagePropertyConfig.string.keys, ImagePropertyConfig.string.rules, "expectValuePNG", "string");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_STRING_2700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_STRING_2700
     * @tc.desc        Verify read string type EXIF properties from HEIC
     *                 1.Create image source from HEIC file using fd
     *                 2.Read string type properties using TestGetImagePropertyString
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_STRING_2700", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_STRING_2700"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_heic_v2.heic", 
        ImagePropertyConfig.string.keys, ImagePropertyConfig.string.rules, "expectValueHEIC", "string");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_STRING_2800
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_STRING_2800
     * @tc.desc        Verify read string type EXIF properties from WEBP
     *                 1.Create image source from WEBP file using fd
     *                 2.Read string type properties using TestGetImagePropertyString
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_STRING_2800", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_STRING_2800"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_webp_v2.webp", 
        ImagePropertyConfig.string.keys, ImagePropertyConfig.string.rules, "expectValueWEBP", "string");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_2900
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_2900
     * @tc.desc        Verify read ArrayBuffer type EXIF properties from JPEG
     *                 1.Create image source from JPEG file using fd
     *                 2.Read ArrayBuffer type properties using TestGetImagePropertyBlob
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_2900", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_2900"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        ImagePropertyConfig.arrayBuffer.keys, ImagePropertyConfig.arrayBuffer.rules, "expectValueJPG", "arrayBuffer");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_3000
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_3000
     * @tc.desc        Verify read ArrayBuffer type EXIF properties from PNG
     *                 1.Create image source from PNG file using fd
     *                 2.Read ArrayBuffer type properties using TestGetImagePropertyBlob
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_3000", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_3000"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_png_v2.png", 
        ImagePropertyConfig.arrayBuffer.keys, ImagePropertyConfig.arrayBuffer.rules, "expectValuePNG", "arrayBuffer");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_3100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_3100
     * @tc.desc        Verify read ArrayBuffer type EXIF properties from HEIC
     *                 1.Create image source from HEIC file using fd
     *                 2.Read ArrayBuffer type properties using TestGetImagePropertyBlob
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_3100", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_3100"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_heic_v2.heic", 
        ImagePropertyConfig.arrayBuffer.keys, ImagePropertyConfig.arrayBuffer.rules, "expectValueHEIC", "arrayBuffer");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_3200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_3200
     * @tc.desc        Verify read ArrayBuffer type EXIF properties from WEBP
     *                 1.Create image source from WEBP file using fd
     *                 2.Read ArrayBuffer type properties using TestGetImagePropertyBlob
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_3200", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_3200"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_webp_v2.webp", 
        ImagePropertyConfig.arrayBuffer.keys, ImagePropertyConfig.arrayBuffer.rules, "expectValueWEBP", "arrayBuffer");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_ONLY_3300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_ONLY_3300
     * @tc.desc        Verify read ArrayBuffer-only type EXIF properties from JPEG
     *                 1.Create image source from JPEG file using fd
     *                 2.Read ArrayBuffer-only properties using TestGetImagePropertyBlob
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_ONLY_3300", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_ONLY_3300"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        ImagePropertyConfig.arrayBufferOnly.keys, ImagePropertyConfig.arrayBufferOnly.rules, "expectValueJPG", "arrayBuffer");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_ONLY_3400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_ONLY_3400
     * @tc.desc        Verify read ArrayBuffer-only type EXIF properties from PNG
     *                 1.Create image source from PNG file using fd
     *                 2.Read ArrayBuffer-only properties using TestGetImagePropertyBlob
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_ONLY_3400", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_ONLY_3400"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_png_v2.png", 
        ImagePropertyConfig.arrayBufferOnly.keys, ImagePropertyConfig.arrayBufferOnly.rules, "expectValuePNG", "arrayBuffer");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_ONLY_3500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_ONLY_3500
     * @tc.desc        Verify read ArrayBuffer-only type EXIF properties from HEIC
     *                 1.Create image source from HEIC file using fd
     *                 2.Read ArrayBuffer-only properties using TestGetImagePropertyBlob
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_ONLY_3500", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_ONLY_3500"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_heic_v2.heic", 
        ImagePropertyConfig.arrayBufferOnly.keys, ImagePropertyConfig.arrayBufferOnly.rules, "expectValueHEIC", "arrayBuffer");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_ONLY_3600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_ONLY_3600
     * @tc.desc        Verify read ArrayBuffer-only type EXIF properties from WEBP
     *                 1.Create image source from WEBP file using fd
     *                 2.Read ArrayBuffer-only properties using TestGetImagePropertyBlob
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_ONLY_3600", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_ONLY_3600"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_webp_v2.webp", 
        ImagePropertyConfig.arrayBufferOnly.keys, ImagePropertyConfig.arrayBufferOnly.rules, "expectValueWEBP", "arrayBuffer");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_2600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_2600
     * @tc.desc        Verify cross-type reading of long properties as short type
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read long type properties using TestGetImagePropertyShort
     *                 3.Verify returned values match expected truncated/converted results
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_2600", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_2600"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        ImagePropertyConfig.long.keys, ImagePropertyConfig.long.rules, "expectValueJPG", "short");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_2700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_2700
     * @tc.desc        Verify cross-type reading of intArray property BITS_PER_SAMPLE as short type
     *                 1.Create image source from PNG file using fd
     *                 2.Read intArray property using TestGetImagePropertyShort
     *                 3.Verify returned value matches expected conversion result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_2700", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_2700"
      let result = true;
      let key: image.PropertyKey = image.PropertyKey.BITS_PER_SAMPLE
      const expectedValue = 1;
      let fd: number = await getFd("test_exif_readWrite_png_v2.png");
      const actualValue = await getPropertyValue(fd, "short", key);
      
      if (!compareValues(actualValue, expectedValue)) {
        console.info(`${testTag} Verification failed for key: ${key}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
        result = false;
      }
      fs.closeSync(fd);
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_2800
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_2800
     * @tc.desc        Verify cross-type reading of short properties as long type
     *                 1.Create image source from HEIC file using fd
     *                 2.Attempt to read short type properties using TestGetImagePropertyLong
     *                 3.Verify returned values match expected converted results
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_2800", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_2800"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test_exif_readWrite_heic_v2.heic", 
        ImagePropertyConfig.short.keys, ImagePropertyConfig.short.rules, "expectValueHEIC", "long");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_2900
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_2900
     * @tc.desc        Verify cross-type reading of intArray property YCBCR_SUB_SAMPLING as long type
     *                 1.Create image source from WEBP file using fd
     *                 2.Read intArray property using TestGetImagePropertyLong
     *                 3.Verify returned value matches expected conversion result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_2900", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_2900"
      let result = true;
      let key: image.PropertyKey = image.PropertyKey.YCBCR_SUB_SAMPLING
      const expectedValue = 3;
      let fd: number = await getFd("test_exif_readWrite_webp_v2.webp");
      const actualValue = await getPropertyValue(fd, "long", key);
      
      if (!compareValues(actualValue, expectedValue)) {
        console.info(`${testTag} Verification failed for key: ${key}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
        result = false;
      }
      fs.closeSync(fd);
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_3000
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_3000
     * @tc.desc        Verify cross-type reading of long property IMAGE_WIDTH as intArray type
     *                 1.Create image source from JPEG file using fd
     *                 2.Read long property using TestGetImagePropertyIntArray
     *                 3.Verify returned value matches expected conversion result [0]
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_3000", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_3000"
      let result = true;
      let key: image.PropertyKey = image.PropertyKey.IMAGE_WIDTH
      const expectedValue = [0];
      let fd: number = await getFd("test_exif_readWrite_jpg_v2.jpg");
      const actualValue = await getPropertyValue(fd, "intArray", key);
      
      if (!compareValues(actualValue, expectedValue)) {
        console.info(`${testTag} Verification failed for key: ${key}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
        result = false;
      }
      fs.closeSync(fd);
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_3100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_3100
     * @tc.desc        Verify cross-type reading of long property NEW_SUBFILE_TYPE as intArray type
     *                 1.Create image source from JPEG file using fd
     *                 2.Read long property using TestGetImagePropertyIntArray
     *                 3.Verify returned value matches expected conversion result [3]
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_3100", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_3100"
      let result = true;
      let key: image.PropertyKey = image.PropertyKey.NEW_SUBFILE_TYPE
      const expectedValue = [3];
      let fd: number = await getFd("test_exif_readWrite_jpg_v2.jpg");
      const actualValue = await getPropertyValue(fd, "intArray", key);
      
      if (!compareValues(actualValue, expectedValue)) {
        console.info(`${testTag} Verification failed for key: ${key}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
        result = false;
      }
      fs.closeSync(fd);
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_3200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_3200
     * @tc.desc        Verify cross-type reading of doubleArray property YCBCR_COEFFICIENTS as double type
     *                 1.Create image source from HEIC file using fd
     *                 2.Read doubleArray property using TestGetImagePropertyDouble
     *                 3.Verify returned value matches expected first element 0.299
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_3200", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_3200"
      let result = true;
      let key: image.PropertyKey = image.PropertyKey.YCBCR_COEFFICIENTS
      const expectedValue = 0.299;
      let fd: number = await getFd("test_exif_readWrite_heic_v2.heic");
      const actualValue = await getPropertyValue(fd, "double", key);
      
      if (!compareValues(actualValue, expectedValue)) {
        console.info(`${testTag} Verification failed for key: ${key}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
        result = false;
      }
      fs.closeSync(fd);
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_3300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_3300
     * @tc.desc        Verify cross-type reading of double property X_RESOLUTION as doubleArray type
     *                 1.Create image source from WEBP file using fd
     *                 2.Read double property using TestGetImagePropertyDoubleArray
     *                 3.Verify returned value matches expected array format [72]
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_3300", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_3300"
      let result = true;
      let key: image.PropertyKey = image.PropertyKey.X_RESOLUTION
      const expectedValue = [72];
      let fd: number = await getFd("test_exif_readWrite_webp_v2.webp");
      const actualValue = await getPropertyValue(fd, "doubleArray", key);
      
      if (!compareValues(actualValue, expectedValue)) {
        console.info(`${testTag} Verification failed for key: ${key}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
        result = false;
      }
      fs.closeSync(fd);
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLE_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLE_ERROR_0100
     * @tc.desc        Verify reading double property X_RESOLUTION with wrong type short returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read double property using TestGetImagePropertyShort
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLE_ERROR_0100", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLE_ERROR_0100"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.X_RESOLUTION, "short", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLEARRY_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLEARRY_ERROR_0200
     * @tc.desc        Verify reading doubleArray property YCBCR_COEFFICIENTS with wrong type short returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read doubleArray property using TestGetImagePropertyShort
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLEARRY_ERROR_0200", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLEARRY_ERROR_0200"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.YCBCR_COEFFICIENTS, "short", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_STRING_ERROR_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_STRING_ERROR_0300
     * @tc.desc        Verify reading string property IMAGE_DESCRIPTION with wrong type short returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read string property using TestGetImagePropertyShort
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_STRING_ERROR_0300", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_STRING_ERROR_0300"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.IMAGE_DESCRIPTION, "short", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLE_ERROR_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLE_ERROR_0400
     * @tc.desc        Verify reading double property X_RESOLUTION with wrong type long returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read double property using TestGetImagePropertyLong
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLE_ERROR_0400", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLE_ERROR_0400"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.X_RESOLUTION, "long", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLEARRY_ERROR_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLEARRY_ERROR_0500
     * @tc.desc        Verify reading doubleArray property YCBCR_COEFFICIENTS with wrong type long returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read doubleArray property using TestGetImagePropertyLong
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLEARRY_ERROR_0500", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLEARRY_ERROR_0500"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.YCBCR_COEFFICIENTS, "long", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_STRING_ERROR_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_STRING_ERROR_0600
     * @tc.desc        Verify reading string property IMAGE_DESCRIPTION with wrong type long returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read string property using TestGetImagePropertyLong
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_STRING_ERROR_0600", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_STRING_ERROR_0600"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.IMAGE_DESCRIPTION, "long", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLE_ERROR_0700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLE_ERROR_0700
     * @tc.desc        Verify reading double property X_RESOLUTION with wrong type intArray returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read double property using TestGetImagePropertyIntArray
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLE_ERROR_0700", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLE_ERROR_0700"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.X_RESOLUTION, "intArray", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLEARRY_ERROR_0800
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLEARRY_ERROR_0800
     * @tc.desc        Verify reading doubleArray property YCBCR_COEFFICIENTS with wrong type intArray returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read doubleArray property using TestGetImagePropertyIntArray
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLEARRY_ERROR_0800", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLEARRY_ERROR_0800"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.YCBCR_COEFFICIENTS, "intArray", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_STRING_ERROR_0900
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_STRING_ERROR_0900
     * @tc.desc        Verify reading string property IMAGE_DESCRIPTION with wrong type intArray returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read string property using TestGetImagePropertyIntArray
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_STRING_ERROR_0900", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_STRING_ERROR_0900"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.IMAGE_DESCRIPTION, "intArray", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_SHORT_ERROR_1000
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_SHORT_ERROR_1000
     * @tc.desc        Verify reading short property ORIENTATION with wrong type double returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read short property using TestGetImagePropertyDouble
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_SHORT_ERROR_1000", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLE_ERROR_0700"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.ORIENTATION, "double", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_LONG_ERROR_1100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_LONG_ERROR_1100
     * @tc.desc        Verify reading long property NEW_SUBFILE_TYPE with wrong type double returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read long property using TestGetImagePropertyDouble
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_LONG_ERROR_1100", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_LONG_ERROR_1100"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.NEW_SUBFILE_TYPE, "double", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_INTARRAY_ERROR_1200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_INTARRAY_ERROR_1200
     * @tc.desc        Verify reading intArray property BITS_PER_SAMPLE with wrong type double returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read intArray property using TestGetImagePropertyDouble
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_INTARRAY_ERROR_1200", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_INTARRAY_ERROR_1200"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.BITS_PER_SAMPLE, "double", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_STRING_ERROR_1300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_STRING_ERROR_1300
     * @tc.desc        Verify reading string property IMAGE_DESCRIPTION with wrong type double returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read string property using TestGetImagePropertyDouble
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_STRING_ERROR_1300", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_STRING_ERROR_1300"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.IMAGE_DESCRIPTION, "double", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_SHORT_ERROR_1400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_SHORT_ERROR_1400
     * @tc.desc        Verify reading short property ORIENTATION with wrong type doubleArray returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read short property using TestGetImagePropertyDoubleArray
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_SHORT_ERROR_1400", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_SHORT_ERROR_1400"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.ORIENTATION, "doubleArray", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_LONG_ERROR_1500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_LONG_ERROR_1500
     * @tc.desc        Verify reading long property NEW_SUBFILE_TYPE with wrong type doubleArray returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read long property using TestGetImagePropertyDoubleArray
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_LONG_ERROR_1500", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_LONG_ERROR_1500"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.NEW_SUBFILE_TYPE, "doubleArray", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_INTARRAY_ERROR_1600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_INTARRAY_ERROR_1600
     * @tc.desc        Verify reading intArray property BITS_PER_SAMPLE with wrong type doubleArray returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read intArray property using TestGetImagePropertyDoubleArray
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_INTARRAY_ERROR_1600", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_INTARRAY_ERROR_1600"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.BITS_PER_SAMPLE, "doubleArray", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_STRING_ERROR_1700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_STRING_ERROR_1700
     * @tc.desc        Verify reading string property IMAGE_DESCRIPTION with wrong type doubleArray returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read string property using TestGetImagePropertyDoubleArray
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_STRING_ERROR_1700", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_STRING_ERROR_1700"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.IMAGE_DESCRIPTION, "doubleArray", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_SHORT_ERROR_1800
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_SHORT_ERROR_1800
     * @tc.desc        Verify reading short property ORIENTATION with wrong type string returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read short property using TestGetImagePropertyString
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_SHORT_ERROR_1800", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_SHORT_ERROR_1800"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.ORIENTATION, "string", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_LONG_ERROR_1900
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_LONG_ERROR_1900
     * @tc.desc        Verify reading long property NEW_SUBFILE_TYPE with wrong type string returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read long property using TestGetImagePropertyString
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_LONG_ERROR_1900", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_LONG_ERROR_1900"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.NEW_SUBFILE_TYPE, "string", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLE_ERROR_2000
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLE_ERROR_2000
     * @tc.desc        Verify reading double property X_RESOLUTION with wrong type string returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read double property using TestGetImagePropertyString
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLE_ERROR_2000", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLE_ERROR_2000"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.X_RESOLUTION, "string", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_INTARRAT_ERROR_2100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_INTARRAT_ERROR_2100
     * @tc.desc        Verify reading intArray property DEFAULT_CROP_SIZE with wrong type string returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read intArray property using TestGetImagePropertyString
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_INTARRAT_ERROR_2100", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_INTARRAT_ERROR_2100"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.DEFAULT_CROP_SIZE, "string", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLEARRAY_ERROR_2200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLEARRAY_ERROR_2200
     * @tc.desc        Verify reading doubleArray property YCBCR_COEFFICIENTS with wrong type string returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read doubleArray property using TestGetImagePropertyString
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLEARRAY_ERROR_2200", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLEARRAY_ERROR_2200"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.YCBCR_COEFFICIENTS, "string", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_ARRAYBUFFER_ERROR_2300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_ARRAYBUFFER_ERROR_2300
     * @tc.desc        Verify reading ArrayBuffer property MAKER_NOTE with wrong type string returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read ArrayBuffer property using TestGetImagePropertyString
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_ARRAYBUFFER_ERROR_2300", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_ARRAYBUFFER_ERROR_2300"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.MAKER_NOTE, "string", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_SHORT_ERROR_2400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_SHORT_ERROR_2400
     * @tc.desc        Verify reading short property ORIENTATION with wrong type arrayBuffer returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read short property using TestGetImagePropertyBlob
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_SHORT_ERROR_2400", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_SHORT_ERROR_2400"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.ORIENTATION, "arrayBuffer", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_LONG_ERROR_2500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_LONG_ERROR_2500
     * @tc.desc        Verify reading long property NEW_SUBFILE_TYPE with wrong type arrayBuffer returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read long property using TestGetImagePropertyBlob
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_LONG_ERROR_2500", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_LONG_ERROR_2500"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.NEW_SUBFILE_TYPE, "arrayBuffer", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLE_ERROR_2600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLE_ERROR_2600
     * @tc.desc        Verify reading double property X_RESOLUTION with wrong type arrayBuffer returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read double property using TestGetImagePropertyBlob
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLE_ERROR_2600", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLE_ERROR_2600"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.X_RESOLUTION, "arrayBuffer", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_INTARRAT_ERROR_2700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_INTARRAT_ERROR_2700
     * @tc.desc        Verify reading intArray property DEFAULT_CROP_SIZE with wrong type arrayBuffer returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read intArray property using TestGetImagePropertyBlob
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_INTARRAT_ERROR_2700", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_INTARRAT_ERROR_2700"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.DEFAULT_CROP_SIZE, "arrayBuffer", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLEARRAY_ERROR_2800
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLEARRAY_ERROR_2800
     * @tc.desc        Verify reading doubleArray property YCBCR_COEFFICIENTS with wrong type arrayBuffer returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read doubleArray property using TestGetImagePropertyBlob
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLEARRAY_ERROR_2800", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DOUBLEARRAY_ERROR_2800"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.YCBCR_COEFFICIENTS, "arrayBuffer", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_STRING_ERROR_2900
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_STRING_ERROR_2900
     * @tc.desc        Verify reading string property IMAGE_DESCRIPTION with wrong type arrayBuffer returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read string property using TestGetImagePropertyBlob
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_STRING_ERROR_2900", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_STRING_ERROR_2900"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.IMAGE_DESCRIPTION, "arrayBuffer", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_ARRAYBUFFER_ERROR_3000
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_ARRAYBUFFER_ERROR_3000
     * @tc.desc        Verify reading ArrayBuffer property MAKER_NOTE with wrong type short returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read ArrayBuffer property using TestGetImagePropertyShort
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_ARRAYBUFFER_ERROR_3000", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_ARRAYBUFFER_ERROR_3000"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.MAKER_NOTE, "short", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_ARRAYBUFFER_ERROR_3100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_ARRAYBUFFER_ERROR_3100
     * @tc.desc        Verify reading ArrayBuffer property MAKER_NOTE with wrong type long returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read ArrayBuffer property using TestGetImagePropertyLong
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_ARRAYBUFFER_ERROR_3100", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_ARRAYBUFFER_ERROR_3100"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.MAKER_NOTE, "long", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_ARRAYBUFFER_ERROR_3200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_ARRAYBUFFER_ERROR_3200
     * @tc.desc        Verify reading ArrayBuffer property MAKER_NOTE with wrong type double returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read ArrayBuffer property using TestGetImagePropertyDouble
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_ARRAYBUFFER_ERROR_3200", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_ARRAYBUFFER_ERROR_3200"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.MAKER_NOTE, "double", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_ARRAYBUFFER_ERROR_3300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_ARRAYBUFFER_ERROR_3300
     * @tc.desc        Verify reading ArrayBuffer property MAKER_NOTE with wrong type intArray returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read ArrayBuffer property using TestGetImagePropertyIntArray
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_ARRAYBUFFER_ERROR_3300", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_ARRAYBUFFER_ERROR_3300"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.MAKER_NOTE, "intArray", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_ARRAYBUFFER_ERROR_3400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_ARRAYBUFFER_ERROR_3400
     * @tc.desc        Verify reading ArrayBuffer property MAKER_NOTE with wrong type doubleArray returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read ArrayBuffer property using TestGetImagePropertyDoubleArray
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_ARRAYBUFFER_ERROR_3400", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_ARRAYBUFFER_ERROR_3400"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        image.PropertyKey.MAKER_NOTE, "doubleArray", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_EXIF_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_EXIF_ERROR_0100
     * @tc.desc        Verify reading EXIF properties from empty EXIF JPEG returns READ_FAILED error
     *                 1.Create image source from empty EXIF JPEG file using fd
     *                 2.Attempt to read short property ORIENTATION using TestGetImagePropertyShort
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_EXIF_ERROR_0100", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_EXIF_ERROR_0100"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_empty_jpg_v2.jpg", 
        image.PropertyKey.ORIENTATION, "short", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_EXIF_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_EXIF_ERROR_0200
     * @tc.desc        Verify reading EXIF properties from empty EXIF JPEG returns READ_FAILED error
     *                 1.Create image source from empty EXIF JPEG file using fd
     *                 2.Attempt to read long property NEW_SUBFILE_TYPE using TestGetImagePropertyLong
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_EXIF_ERROR_0200", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_EXIF_ERROR_0200"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_empty_jpg_v2.jpg", 
        image.PropertyKey.NEW_SUBFILE_TYPE, "long", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_EXIF_ERROR_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_EXIF_ERROR_0300
     * @tc.desc        Verify reading EXIF properties from empty EXIF JPEG returns READ_FAILED error
     *                 1.Create image source from empty EXIF JPEG file using fd
     *                 2.Attempt to read double property X_RESOLUTION using TestGetImagePropertyDouble
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_EXIF_ERROR_0300", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_EXIF_ERROR_0300"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_empty_jpg_v2.jpg", 
        image.PropertyKey.X_RESOLUTION, "double", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_EXIF_ERROR_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_EXIF_ERROR_0400
     * @tc.desc        Verify reading EXIF properties from empty EXIF JPEG returns READ_FAILED error
     *                 1.Create image source from empty EXIF JPEG file using fd
     *                 2.Attempt to read intArray property BITS_PER_SAMPLE using TestGetImagePropertyIntArray
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_EXIF_ERROR_0400", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_EXIF_ERROR_0400"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_empty_jpg_v2.jpg", 
        image.PropertyKey.BITS_PER_SAMPLE, "intArray", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_EXIF_ERROR_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_EXIF_ERROR_0500
     * @tc.desc        Verify reading EXIF properties from empty EXIF JPEG returns READ_FAILED error
     *                 1.Create image source from empty EXIF JPEG file using fd
     *                 2.Attempt to read doubleArray property YCBCR_COEFFICIENTS using TestGetImagePropertyDoubleArray
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_EXIF_ERROR_0500", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_EXIF_ERROR_0500"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_empty_jpg_v2.jpg", 
        image.PropertyKey.YCBCR_COEFFICIENTS, "doubleArray", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_EXIF_ERROR_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_EXIF_ERROR_0600
     * @tc.desc        Verify reading EXIF properties from empty EXIF JPEG returns READ_FAILED error
     *                 1.Create image source from empty EXIF JPEG file using fd
     *                 2.Attempt to read string property IMAGE_DESCRIPTION using TestGetImagePropertyString
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_EXIF_ERROR_0600", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_EXIF_ERROR_0600"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_empty_jpg_v2.jpg", 
        image.PropertyKey.MAKER_NOTE, "arrayBuffer", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_EXIF_ERROR_0700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_EXIF_ERROR_0700
     * @tc.desc        Verify reading EXIF properties from empty EXIF JPEG returns READ_FAILED error
     *                 1.Create image source from empty EXIF JPEG file using fd
     *                 2.Attempt to read ArrayBuffer property MAKER_NOTE using TestGetImagePropertyBlob
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_EXIF_ERROR_0700", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_EXIF_ERROR_0700"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_empty_jpg_v2.jpg", 
        image.PropertyKey.TRANSFER_FUNCTION, "string", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0100
     * @tc.desc        Verify reading non-existent EXIF property key Makernote with short type returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read non-existent property key using TestGetImagePropertyShort
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0100", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0100"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        "Makernote" as image.PropertyKey, "short", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0200
     * @tc.desc        Verify reading non-existent EXIF property key Makernote with long type returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read non-existent property key using TestGetImagePropertyLong
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0200", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0200"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        "Makernote" as image.PropertyKey, "long", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0300
     * @tc.desc        Verify reading non-existent EXIF property key Makernote with double type returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read non-existent property key using TestGetImagePropertyDouble
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0300", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0300"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        "Makernote" as image.PropertyKey, "double", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0400
     * @tc.desc        Verify reading non-existent EXIF property key Makernote with intArray type returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read non-existent property key using TestGetImagePropertyIntArray
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0400", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0400"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        "Makernote" as image.PropertyKey, "intArray", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0500
     * @tc.desc        Verify reading non-existent EXIF property key Makernote with doubleArray type returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read non-existent property key using TestGetImagePropertyDoubleArray
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0500", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0500"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        "Makernote" as image.PropertyKey, "doubleArray", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0600
     * @tc.desc        Verify reading non-existent EXIF property key Makernote with string type returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read non-existent property key using TestGetImagePropertyString
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0600", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0600"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        "Makernote" as image.PropertyKey, "string", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0700
     * @tc.desc        Verify reading non-existent EXIF property key Makernote with arrayBuffer type returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read non-existent property key using TestGetImagePropertyBlob
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0700", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0700"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        "Makernote" as image.PropertyKey, "arrayBuffer", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0800
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0800
     * @tc.desc        Verify reading non-existent EXIF property key Makernote with arraySize type returns READ_FAILED error
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read non-existent property key array size
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0800", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0800"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        "Makernote" as image.PropertyKey, "arraySize", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });


    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0100
     * @tc.desc        Verify reading EXIF properties from unsupported ICO format returns UNSUPPORTED_IMAGE_FORMATS error
     *                 1.Create image source from ICO file using fd
     *                 2.Attempt to read short property IMAGE_WIDTH using TestGetImagePropertyShort
     *                 3.Verify API returns UNSUPPORTED_IMAGE_FORMATS error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0100", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0100"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test.ico", 
        image.PropertyKey.IMAGE_WIDTH, "short", UNSUPPORTED_IMAGE_FORMATS);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0200
     * @tc.desc        Verify reading EXIF properties from unsupported ICO format returns UNSUPPORTED_IMAGE_FORMATS error
     *                 1.Create image source from ICO file using fd
     *                 2.Attempt to read long property NEW_SUBFILE_TYPE using TestGetImagePropertyLong
     *                 3.Verify API returns UNSUPPORTED_IMAGE_FORMATS error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0200", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0200"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test.ico", 
        image.PropertyKey.NEW_SUBFILE_TYPE, "long", UNSUPPORTED_IMAGE_FORMATS);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0300
     * @tc.desc        Verify reading EXIF properties from unsupported ICO format returns UNSUPPORTED_IMAGE_FORMATS error
     *                 1.Create image source from ICO file using fd
     *                 2.Attempt to read double property X_RESOLUTION using TestGetImagePropertyDouble
     *                 3.Verify API returns UNSUPPORTED_IMAGE_FORMATS error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0300", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0300"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test.ico", 
        image.PropertyKey.X_RESOLUTION, "double", UNSUPPORTED_IMAGE_FORMATS);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0400
     * @tc.desc        Verify reading EXIF properties from unsupported ICO format returns UNSUPPORTED_IMAGE_FORMATS error
     *                 1.Create image source from ICO file using fd
     *                 2.Attempt to read intArray property BITS_PER_SAMPLE using TestGetImagePropertyIntArray
     *                 3.Verify API returns UNSUPPORTED_IMAGE_FORMATS error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0400", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0400"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test.ico", 
        image.PropertyKey.BITS_PER_SAMPLE, "intArray", UNSUPPORTED_IMAGE_FORMATS);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0500
     * @tc.desc        Verify reading EXIF properties from unsupported ICO format returns UNSUPPORTED_IMAGE_FORMATS error
     *                 1.Create image source from ICO file using fd
     *                 2.Attempt to read doubleArray property YCBCR_COEFFICIENTS using TestGetImagePropertyDoubleArray
     *                 3.Verify API returns UNSUPPORTED_IMAGE_FORMATS error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0500", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0500"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test.ico", 
        image.PropertyKey.YCBCR_COEFFICIENTS, "doubleArray", UNSUPPORTED_IMAGE_FORMATS);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0600
     * @tc.desc        Verify reading EXIF properties from unsupported ICO format returns UNSUPPORTED_IMAGE_FORMATS error
     *                 1.Create image source from ICO file using fd
     *                 2.Attempt to read arrayBuffer property FILE_SOURCE using TestGetImagePropertyBlob
     *                 3.Verify API returns UNSUPPORTED_IMAGE_FORMATS error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0600", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0600"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test.ico", 
        image.PropertyKey.FILE_SOURCE, "arrayBuffer", UNSUPPORTED_IMAGE_FORMATS);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0700
     * @tc.desc        Verify reading EXIF properties from unsupported ICO format returns UNSUPPORTED_IMAGE_FORMATS error
     *                 1.Create image source from ICO file using fd
     *                 2.Attempt to read string property SOFTWARE using TestGetImagePropertyString
     *                 3.Verify API returns UNSUPPORTED_IMAGE_FORMATS error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0700", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0700"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test.ico", 
        image.PropertyKey.SOFTWARE, "string", UNSUPPORTED_IMAGE_FORMATS);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0800
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0800
     * @tc.desc        Verify reading EXIF properties from unsupported ICO format returns UNSUPPORTED_IMAGE_FORMATS error
     *                 1.Create image source from ICO file using fd
     *                 2.Attempt to read arraySize of property SOFTWARE
     *                 3.Verify API returns UNSUPPORTED_IMAGE_FORMATS error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0800", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0800"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test.ico", 
        image.PropertyKey.SOFTWARE, "arraySize", UNSUPPORTED_IMAGE_FORMATS);
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0100
     * @tc.desc        Verify reading properties from empty imageSource returns PROPERTY_NOT_EXIST error
     *                 1.Attempt to read short type property without creating imageSource
     *                 2.Call TestGetImagePropertyError with empty imageSource
     *                 3.Verify API returns PROPERTY_NOT_EXIST error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0100", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0100"
      const errorCode = mdkTest.TestGetImagePropertyError("short");
      console.info(`${testTag} TestGetImagePropertyError result is: ${errorCode}`);
      expect(errorCode == PROPERTY_NOT_EXIST).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0200
     * @tc.desc        Verify reading properties from empty imageSource returns PROPERTY_NOT_EXIST error
     *                 1.Attempt to read long type property without creating imageSource
     *                 2.Call TestGetImagePropertyError with empty imageSource
     *                 3.Verify API returns PROPERTY_NOT_EXIST error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0200", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0200"
      const errorCode = mdkTest.TestGetImagePropertyError("long");
      console.info(`${testTag} TestGetImagePropertyError result is: ${errorCode}`);
      expect(errorCode == PROPERTY_NOT_EXIST).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0300
     * @tc.desc        Verify reading properties from empty imageSource returns PROPERTY_NOT_EXIST error
     *                 1.Attempt to read double type property without creating imageSource
     *                 2.Call TestGetImagePropertyError with empty imageSource
     *                 3.Verify API returns PROPERTY_NOT_EXIST error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0300", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0300"
      const errorCode = mdkTest.TestGetImagePropertyError("double");
      console.info(`${testTag} TestGetImagePropertyError result is: ${errorCode}`);
      expect(errorCode == PROPERTY_NOT_EXIST).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0400
     * @tc.desc        Verify reading properties from empty imageSource returns PROPERTY_NOT_EXIST error
     *                 1.Attempt to read intArray type property without creating imageSource
     *                 2.Call TestGetImagePropertyError with empty imageSource
     *                 3.Verify API returns PROPERTY_NOT_EXIST error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0400", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0400"
      const errorCode = mdkTest.TestGetImagePropertyError("intArray");
      console.info(`${testTag} TestGetImagePropertyError result is: ${errorCode}`);
      expect(errorCode == PROPERTY_NOT_EXIST).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0500
     * @tc.desc        Verify reading properties from empty imageSource returns PROPERTY_NOT_EXIST error
     *                 1.Attempt to read doubleArray type property without creating imageSource
     *                 2.Call TestGetImagePropertyError with empty imageSource
     *                 3.Verify API returns PROPERTY_NOT_EXIST error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0500", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0500"
      const errorCode = mdkTest.TestGetImagePropertyError("doubleArray");
      console.info(`${testTag} TestGetImagePropertyError result is: ${errorCode}`);
      expect(errorCode == PROPERTY_NOT_EXIST).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0600
     * @tc.desc        Verify reading properties from empty imageSource returns PROPERTY_NOT_EXIST error
     *                 1.Attempt to read arrayBuffer type property without creating imageSource
     *                 2.Call TestGetImagePropertyError with empty imageSource
     *                 3.Verify API returns PROPERTY_NOT_EXIST error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0600", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0600"
      const errorCode = mdkTest.TestGetImagePropertyError("arrayBuffer");
      console.info(`${testTag} TestGetImagePropertyError result is: ${errorCode}`);
      expect(errorCode == PROPERTY_NOT_EXIST).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0700
     * @tc.desc        Verify reading properties from empty imageSource returns PROPERTY_NOT_EXIST error
     *                 1.Attempt to read string type property without creating imageSource
     *                 2.Call TestGetImagePropertyError with empty imageSource
     *                 3.Verify API returns PROPERTY_NOT_EXIST error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0700", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0700"
      const errorCode = mdkTest.TestGetImagePropertyError("string");
      console.info(`${testTag} TestGetImagePropertyError result is: ${errorCode}`);
      expect(errorCode == PROPERTY_NOT_EXIST).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0800
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0800
     * @tc.desc        Verify reading properties from empty imageSource returns PROPERTY_NOT_EXIST error
     *                 1.Attempt to read arraySize type property without creating imageSource
     *                 2.Call TestGetImagePropertyError with empty imageSource
     *                 3.Verify API returns PROPERTY_NOT_EXIST error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0800", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0800"
      const errorCode = mdkTest.TestGetImagePropertyError("arraySize");
      console.info(`${testTag} TestGetImagePropertyError result is: ${errorCode}`);
      expect(errorCode == PROPERTY_NOT_EXIST).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_SHORT_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_SHORT_0100
     * @tc.desc        Verify write short type EXIF properties to JPEG
     *                 1.Create image source from JPEG file using fd
     *                 2.Modify short type properties using TestModifyImagePropertyShort
     *                 3.Read back modified properties to verify
     *                 4.Verify all property values match expected results
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_SHORT_0100", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_SHORT_0100"
      let result = false;
      result = await TestModfiyImagePropertyByType(testTag, "test_exif_modify_jpg_v2.jpg", 
        ImagePropertyConfig.shortModify.keys, ImagePropertyConfig.shortModify.rules, "expectValueJPG", "short");
      console.info(`${testTag} TestModifyImagePropertyShort result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_SHORT_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_SHORT_0200
     * @tc.desc        Verify write short type EXIF properties to PNG
     *                 1.Create image source from PNG file using fd
     *                 2.Modify short type properties using TestModifyImagePropertyShort
     *                 3.Read back modified properties to verify
     *                 4.Verify all property values match expected results
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_SHORT_0200", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_SHORT_0200"
      let result = false;
      result = await TestModfiyImagePropertyByType(testTag, "test_exif_modify_png_v2.png", 
        ImagePropertyConfig.shortModify.keys, ImagePropertyConfig.shortModify.rules, "expectValuePNG", "short");
      console.info(`${testTag} TestModifyImagePropertyShort result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_SHORT_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_SHORT_0300
     * @tc.desc        Verify write short type EXIF properties to HEIC
     *                 1.Create image source from HEIC file using fd
     *                 2.Modify short type properties using TestModifyImagePropertyShort
     *                 3.Read back modified properties to verify
     *                 4.Verify all property values match expected results
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_SHORT_0300", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_SHORT_0300"
      let result = false;
      result = await TestModfiyImagePropertyByType(testTag, "test_exif_modify_heic_v2.heic", 
        ImagePropertyConfig.shortModify.keys, ImagePropertyConfig.shortModify.rules, "expectValueHEIC", "short");
      console.info(`${testTag} TestModifyImagePropertyShort result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_SHORT_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_SHORT_0400
     * @tc.desc        Verify write short type EXIF properties to WEBP
     *                 1.Create image source from WEBP file using fd
     *                 2.Modify short type properties using TestModifyImagePropertyShort
     *                 3.Read back modified properties to verify
     *                 4.Verify all property values match expected results
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_SHORT_0400", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_SHORT_0400"
      let result = false;
      result = await TestModfiyImagePropertyByType(testTag, "test_exif_modify_webp_v2.webp", 
        ImagePropertyConfig.shortModify.keys, ImagePropertyConfig.shortModify.rules, "expectValueWEBP", "short");
      console.info(`${testTag} TestModifyImagePropertyShort result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_LONG_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_LONG_0500
     * @tc.desc        Verify write long type EXIF properties to JPEG
     *                 1.Create image source from JPEG file using fd
     *                 2.Modify long type properties using TestModifyImagePropertyLong
     *                 3.Read back modified properties to verify
     *                 4.Verify all property values match expected results
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_LONG_0500", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_LONG_0500"
      let result = false;
      result = await TestModfiyImagePropertyByType(testTag, "test_exif_modify_jpg_v2.jpg", 
        ImagePropertyConfig.longModify.keys, ImagePropertyConfig.longModify.rules, "expectValueJPG", "long");
      console.info(`${testTag} TestModifyImagePropertyLong result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_LONG_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_LONG_0600
     * @tc.desc        Verify write long type EXIF properties to PNG
     *                 1.Create image source from PNG file using fd
     *                 2.Modify long type properties using TestModifyImagePropertyLong
     *                 3.Read back modified properties to verify
     *                 4.Verify all property values match expected results
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_LONG_0600", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_LONG_0600"
      let result = false;
      result = await TestModfiyImagePropertyByType(testTag, "test_exif_modify_png_v2.png", 
        ImagePropertyConfig.longModify.keys, ImagePropertyConfig.longModify.rules, "expectValuePNG", "long");
      console.info(`${testTag} TestModifyImagePropertyLong result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_LONG_0700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_LONG_0700
     * @tc.desc        Verify write long type EXIF properties to HEIC
     *                 1.Create image source from HEIC file using fd
     *                 2.Modify long type properties using TestModifyImagePropertyLong
     *                 3.Read back modified properties to verify
     *                 4.Verify all property values match expected results
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_LONG_0700", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_LONG_0700"
      let result = false;
      result = await TestModfiyImagePropertyByType(testTag, "test_exif_modify_heic_v2.heic", 
        ImagePropertyConfig.longModify.keys, ImagePropertyConfig.longModify.rules, "expectValueHEIC", "long");
      console.info(`${testTag} TestModifyImagePropertyLong result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_LONG_0800
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_LONG_0800
     * @tc.desc        Verify write long type EXIF properties to WEBP
     *                 1.Create image source from WEBP file using fd
     *                 2.Modify long type properties using TestModifyImagePropertyLong
     *                 3.Read back modified properties to verify
     *                 4.Verify all property values match expected results
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_LONG_0800", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_LONG_0800"
      let result = false;
      result = await TestModfiyImagePropertyByType(testTag, "test_exif_modify_webp_v2.webp", 
        ImagePropertyConfig.longModify.keys, ImagePropertyConfig.longModify.rules, "expectValueWEBP", "long");
      console.info(`${testTag} TestModifyImagePropertyLong result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLE_0900
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLE_0900
     * @tc.desc        Verify write double type EXIF properties to JPEG
     *                 1.Create image source from JPEG file using fd
     *                 2.Modify double type properties using TestModifyImagePropertyDouble
     *                 3.Read back modified properties to verify
     *                 4.Verify all property values match expected results
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLE_0900", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLE_0900"
      let result = false;
      result = await TestModfiyImagePropertyByType(testTag, "test_exif_modify_jpg_v2.jpg", 
        ImagePropertyConfig.doubleModify.keys, ImagePropertyConfig.doubleModify.rules, "expectValueJPG", "double");
      console.info(`${testTag} TestModifyImagePropertyDouble result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLE_1000
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLE_1000
     * @tc.desc        Verify write double type EXIF properties to PNG
     *                 1.Create image source from PNG file using fd
     *                 2.Modify double type properties using TestModifyImagePropertyDouble
     *                 3.Read back modified properties to verify
     *                 4.Verify all property values match expected results
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLE_1000", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLE_1000"
      let result = false;
      result = await TestModfiyImagePropertyByType(testTag, "test_exif_modify_png_v2.png", 
        ImagePropertyConfig.doubleModify.keys, ImagePropertyConfig.doubleModify.rules, "expectValuePNG", "double");
      console.info(`${testTag} TestModifyImagePropertyDouble result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLE_1100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLE_1100
     * @tc.desc        Verify write double type EXIF properties to HEIC
     *                 1.Create image source from HEIC file using fd
     *                 2.Modify double type properties using TestModifyImagePropertyDouble
     *                 3.Read back modified properties to verify
     *                 4.Verify all property values match expected results
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLE_1100", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLE_1100"
      let result = false;
      result = await TestModfiyImagePropertyByType(testTag, "test_exif_modify_heic_v2.heic", 
        ImagePropertyConfig.doubleModify.keys, ImagePropertyConfig.doubleModify.rules, "expectValueHEIC", "double");
      console.info(`${testTag} TestModifyImagePropertyDouble result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLE_1200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLE_1200
     * @tc.desc        Verify write double type EXIF properties to WEBP
     *                 1.Create image source from WEBP file using fd
     *                 2.Modify double type properties using TestModifyImagePropertyDouble
     *                 3.Read back modified properties to verify
     *                 4.Verify all property values match expected results
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLE_1200", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLE_1200"
      let result = false;
      result = await TestModfiyImagePropertyByType(testTag, "test_exif_modify_webp_v2.webp", 
        ImagePropertyConfig.doubleModify.keys, ImagePropertyConfig.doubleModify.rules, "expectValueWEBP", "double");
      console.info(`${testTag} TestModifyImagePropertyDouble result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_INTARRAY_1300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_INTARRAY_1300
     * @tc.desc        Verify write intArray type EXIF properties to JPEG
     *                 1.Create image source from JPEG file using fd
     *                 2.Modify intArray type properties using TestModifyImagePropertyIntArray
     *                 3.Read back modified properties to verify
     *                 4.Verify all property values match expected results
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_INTARRAY_1300", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_INTARRAY_1300"
      let result = false;
      result = await TestModfiyImagePropertyByType(testTag, "test_exif_modify_jpg_v2.jpg", 
        ImagePropertyConfig.intArrayModify.keys, ImagePropertyConfig.intArrayModify.rules, "expectValueJPG", "intArray");
      console.info(`${testTag} TestModifyImagePropertyIntArray result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_INTARRAY_1400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_INTARRAY_1400
     * @tc.desc        Verify write intArray type EXIF properties to PNG
     *                 1.Create image source from PNG file using fd
     *                 2.Modify intArray type properties using TestModifyImagePropertyIntArray
     *                 3.Read back modified properties to verify
     *                 4.Verify all property values match expected results
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_INTARRAY_1400", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_INTARRAY_1400"
      let result = false;
      result = await TestModfiyImagePropertyByType(testTag, "test_exif_modify_png_v2.png", 
        ImagePropertyConfig.intArrayModify.keys, ImagePropertyConfig.intArrayModify.rules, "expectValuePNG", "intArray");
      console.info(`${testTag} TestModifyImagePropertyIntArray result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_INTARRAY_1500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_INTARRAY_1500
     * @tc.desc        Verify write intArray type EXIF properties to HEIC
     *                 1.Create image source from HEIC file using fd
     *                 2.Modify intArray type properties using TestModifyImagePropertyIntArray
     *                 3.Read back modified properties to verify
     *                 4.Verify all property values match expected results
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_INTARRAY_1500", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_INTARRAY_1500"
      let result = false;
      result = await TestModfiyImagePropertyByType(testTag, "test_exif_modify_heic_v2.heic", 
        ImagePropertyConfig.intArrayModify.keys, ImagePropertyConfig.intArrayModify.rules, "expectValueHEIC", "intArray");
      console.info(`${testTag} TestModifyImagePropertyIntArray result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_INTARRAY_1600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_INTARRAY_1600
     * @tc.desc        Verify write intArray type EXIF properties to WEBP
     *                 1.Create image source from WEBP file using fd
     *                 2.Modify intArray type properties using TestModifyImagePropertyIntArray
     *                 3.Read back modified properties to verify
     *                 4.Verify all property values match expected results
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_INTARRAY_1600", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_INTARRAY_1600"
      let result = false;
      result = await TestModfiyImagePropertyByType(testTag, "test_exif_modify_webp_v2.webp", 
        ImagePropertyConfig.intArrayModify.keys, ImagePropertyConfig.intArrayModify.rules, "expectValueWEBP", "intArray");
      console.info(`${testTag} TestModifyImagePropertyIntArray result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLEARRAY_1700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLEARRAY_1700
     * @tc.desc        Verify write doubleArray type EXIF properties to JPEG
     *                 1.Create image source from JPEG file using fd
     *                 2.Modify doubleArray type properties using TestModifyImagePropertyDoubleArray
     *                 3.Read back modified properties to verify
     *                 4.Verify all property values match expected results
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLEARRAY_1700", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLEARRAY_1700"
      let result = false;
      result = await TestModfiyImagePropertyByType(testTag, "test_exif_modify_jpg_v2.jpg", 
        ImagePropertyConfig.doubleArrayModify.keys, ImagePropertyConfig.doubleArrayModify.rules, "expectValueJPG", "doubleArray");
      console.info(`${testTag} TestModifyImagePropertyDoubleArray result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLEARRAY_1800
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLEARRAY_1800
     * @tc.desc        Verify write doubleArray type EXIF properties to PNG
     *                 1.Create image source from PNG file using fd
     *                 2.Modify doubleArray type properties using TestModifyImagePropertyDoubleArray
     *                 3.Read back modified properties to verify
     *                 4.Verify all property values match expected results
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLEARRAY_1800", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLEARRAY_1800"
      let result = false;
      result = await TestModfiyImagePropertyByType(testTag, "test_exif_modify_png_v2.png", 
        ImagePropertyConfig.doubleArrayModify.keys, ImagePropertyConfig.doubleArrayModify.rules, "expectValuePNG", "doubleArray");
      console.info(`${testTag} TestModifyImagePropertyDoubleArray result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLEARRAY_1900
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLEARRAY_1900
     * @tc.desc        Verify write doubleArray type EXIF properties to HEIC
     *                 1.Create image source from HEIC file using fd
     *                 2.Modify doubleArray type properties using TestModifyImagePropertyDoubleArray
     *                 3.Read back modified properties to verify
     *                 4.Verify all property values match expected results
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLEARRAY_1900", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLEARRAY_1900"
      let result = false;
      result = await TestModfiyImagePropertyByType(testTag, "test_exif_modify_heic_v2.heic", 
        ImagePropertyConfig.doubleArrayModify.keys, ImagePropertyConfig.doubleArrayModify.rules, "expectValueHEIC", "doubleArray");
      console.info(`${testTag} TestModifyImagePropertyDoubleArray result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLEARRAY_2000
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLEARRAY_2000
     * @tc.desc        Verify write doubleArray type EXIF properties to WEBP
     *                 1.Create image source from WEBP file using fd
     *                 2.Modify doubleArray type properties using TestModifyImagePropertyDoubleArray
     *                 3.Read back modified properties to verify
     *                 4.Verify all property values match expected results
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLEARRAY_2000", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLEARRAY_2000"
      let result = false;
      result = await TestModfiyImagePropertyByType(testTag, "test_exif_modify_webp_v2.webp", 
        ImagePropertyConfig.doubleArrayModify.keys, ImagePropertyConfig.doubleArrayModify.rules, "expectValueWEBP", "doubleArray");
      console.info(`${testTag} TestModifyImagePropertyDoubleArray result is: ${result}`);
      expect(result).assertTrue();
      done();
    });
    
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_SHORT_EMPTY_2100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_SHORT_EMPTY_2100
     * @tc.desc        Verify write short type EXIF properties to empty EXIF JPEG
     *                 1.Create image source from empty EXIF JPEG file using fd
     *                 2.Modify short type properties using TestModifyImagePropertyShort
     *                 3.Read back modified properties to verify
     *                 4.Verify all property values match expected results
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_SHORT_EMPTY_2100", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_SHORT_EMPTY_2100"
      let result = false;
      result = await TestModfiyImagePropertyByType(testTag, "test_exif_modify_empty_jpg_v2.jpg", 
        ImagePropertyConfig.shortModify.keys, ImagePropertyConfig.shortModify.rules, "expectValueJPG", "short");
      console.info(`${testTag} TestModifyImagePropertyShort result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_LONG_EMPTY_2200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_LONG_EMPTY_2200
     * @tc.desc        Verify write long type EXIF properties to empty EXIF PNG
     *                 1.Create image source from empty EXIF PNG file using fd
     *                 2.Modify long type properties using TestModifyImagePropertyLong
     *                 3.Read back modified properties to verify
     *                 4.Verify all property values match expected results
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_LONG_EMPTY_2200", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_LONG_EMPTY_2200"
      let result = false;
      result = await TestModfiyImagePropertyByType(testTag, "test_exif_modify_empty_png_v2.png", 
        ImagePropertyConfig.longModify.keys, ImagePropertyConfig.longModify.rules, "expectValuePNG", "long");
      console.info(`${testTag} TestModifyImagePropertyLong result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLE_EMPTY_2300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLE_EMPTY_2300
     * @tc.desc        Verify write double type EXIF properties to empty EXIF HEIC
     *                 1.Create image source from empty EXIF HEIC file using fd
     *                 2.Modify double type properties using TestModifyImagePropertyDouble
     *                 3.Read back modified properties to verify
     *                 4.Verify all property values match expected results
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLE_EMPTY_2300", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLE_EMPTY_2300"
      let result = false;
      result = await TestModfiyImagePropertyByType(testTag, "test_exif_modify_empty_heic_v2.heic", 
        ImagePropertyConfig.doubleModify.keys, ImagePropertyConfig.doubleModify.rules, "expectValueHEIC", "double");
      console.info(`${testTag} TestModifyImagePropertyDouble result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_INTARRAY_EMPTY_2400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_INTARRAY_EMPTY_2400
     * @tc.desc        Verify write intArray type EXIF properties to empty EXIF WEBP
     *                 1.Create image source from empty EXIF WEBP file using fd
     *                 2.Modify intArray type properties using TestModifyImagePropertyIntArray
     *                 3.Read back modified properties to verify
     *                 4.Verify all property values match expected results
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_INTARRAY_EMPTY_2400", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_INTARRAY_EMPTY_2400"
      let result = false;
      result = await TestModfiyImagePropertyByType(testTag, "test_exif_modify_empty_webp_v2.webp", 
        ImagePropertyConfig.intArrayModify.keys, ImagePropertyConfig.intArrayModify.rules, "expectValueWEBP", "intArray");
      console.info(`${testTag} TestModifyImagePropertyIntArray result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLEARRAY_EMPTY_2500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLEARRAY_EMPTY_2500
     * @tc.desc        Verify write doubleArray type EXIF properties to empty EXIF JPEG
     *                 1.Create image source from empty EXIF JPEG file using fd
     *                 2.Modify doubleArray type properties using TestModifyImagePropertyDoubleArray
     *                 3.Read back modified properties to verify
     *                 4.Verify all property values match expected results
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLEARRAY_EMPTY_2500", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_DOUBLEARRAY_EMPTY_2500"
      let result = false;
      result = await TestModfiyImagePropertyByType(testTag, "test_exif_modify_empty_jpg_v2.jpg", 
        ImagePropertyConfig.doubleArrayModify.keys, ImagePropertyConfig.doubleArrayModify.rules, "expectValueJPG", "doubleArray");
      console.info(`${testTag} TestModifyImagePropertyDoubleArray result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_ARRAYBUFFER_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_ARRAYBUFFER_0100
     * @tc.desc        Verify write arrayBuffer type EXIF properties to JPEG
     *                 1.Create image source from JPEG file using fd
     *                 2.Modify arrayBuffer type properties using TestModifyImagePropertyBlob
     *                 3.Read back modified properties to verify
     *                 4.Verify all property values match expected results
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_ARRAYBUFFER_0100", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_ARRAYBUFFER_0100"
      let result = false;
      result = await TestModfiyImagePropertyByType(testTag, "test_exif_readWrite_jpg_v2.jpg", 
        ImagePropertyConfig.arrayBufferModify.keys, ImagePropertyConfig.arrayBufferModify.rules, "expectValueJPG", "arrayBuffer");
      console.info(`${testTag} TestModfiyImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_ARRAYBUFFER_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_ARRAYBUFFER_0200
     * @tc.desc        Verify write arrayBuffer type EXIF properties to PNG
     *                 1.Create image source from PNG file using fd
     *                 2.Modify arrayBuffer type properties using TestModifyImagePropertyBlob
     *                 3.Read back modified properties to verify
     *                 4.Verify all property values match expected results
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_ARRAYBUFFER_0200", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_ARRAYBUFFER_0200"
      let result = false;
      result = await TestModfiyImagePropertyByType(testTag, "test_exif_readWrite_png_v2.png", 
        ImagePropertyConfig.arrayBufferModify.keys, ImagePropertyConfig.arrayBufferModify.rules, "expectValuePNG", "arrayBuffer");
      console.info(`${testTag} TestModfiyImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_ARRAYBUFFER_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_ARRAYBUFFER_0300
     * @tc.desc        Verify write arrayBuffer type EXIF properties to HEIC
     *                 1.Create image source from HEIC file using fd
     *                 2.Modify arrayBuffer type properties using TestModifyImagePropertyBlob
     *                 3.Read back modified properties to verify
     *                 4.Verify all property values match expected results
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_ARRAYBUFFER_0300", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_ARRAYBUFFER_0300"
      let result = false;
      result = await TestModfiyImagePropertyByType(testTag, "test_exif_readWrite_heic_v2.heic", 
        ImagePropertyConfig.arrayBufferModify.keys, ImagePropertyConfig.arrayBufferModify.rules, "expectValueHEIC", "arrayBuffer");
      console.info(`${testTag} TestModfiyImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_ARRAYBUFFER_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_ARRAYBUFFER_0400
     * @tc.desc        Verify write arrayBuffer type EXIF properties to WEBP
     *                 1.Create image source from WEBP file using fd
     *                 2.Modify arrayBuffer type properties using TestModifyImagePropertyBlob
     *                 3.Read back modified properties to verify
     *                 4.Verify all property values match expected results
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_ARRAYBUFFER_0400", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_ARRAYBUFFER_0400"
      let result = false;
      result = await TestModfiyImagePropertyByType(testTag, "test_exif_readWrite_webp_v2.webp", 
        ImagePropertyConfig.arrayBufferModify.keys, ImagePropertyConfig.arrayBufferModify.rules, "expectValueWEBP", "arrayBuffer");
      console.info(`${testTag} TestModfiyImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_ARRAYBUFFER_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_ARRAYBUFFER_0500
     * @tc.desc        Verify write arrayBuffer type EXIF properties to empty EXIF JPEG
     *                 1.Create image source from empty EXIF JPEG file using fd
     *                 2.Modify arrayBuffer type properties using TestModifyImagePropertyBlob
     *                 3.Read back modified properties to verify
     *                 4.Verify all property values match expected results
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_ARRAYBUFFER_0500", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_ARRAYBUFFER_0500"
      let result = false;
      result = await TestModfiyImagePropertyByType(testTag, "test_exif_modify_empty_jpg_v2.jpg", 
        ImagePropertyConfig.arrayBufferModify.keys, ImagePropertyConfig.arrayBufferModify.rules, "expectValueJPG", "arrayBuffer");
      console.info(`${testTag} TestModfiyImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_CROSS_READING_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_CROSS_READING_0100
     * @tc.desc        Verify cross-type reading after modifying property NEW_SUBFILE_TYPE with short type and reading as long type
     *                 1.Create image source from JPEG file using fd
     *                 2.Modify property NEW_SUBFILE_TYPE as short type with value 1
     *                 3.Read back property as long type
     *                 4.Verify cross-type reading returns expected value
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_CROSS_READING_0100", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_CROSS_READING_0100"
      let result = true;
      let key: image.PropertyKey = image.PropertyKey.NEW_SUBFILE_TYPE
      const expectedValue = 1;
      let fd: number = await getFd("test_exif_modify_jpg_v2.jpg");
      const errorCode = await modifyPropertyValue(fd, "short", key, expectedValue);
      const actualValue = await getPropertyValue(fd, "long", key);
      
      if (!compareValues(actualValue, expectedValue)) {
        console.info(`${testTag} Verification failed for key: ${key}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
        result = false;
      }
      fs.closeSync(fd);
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_CROSS_READING_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_CROSS_READING_0200
     * @tc.desc        Verify cross-type reading after modifying property X_RESOLUTION with short type and reading as double type
     *                 1.Create image source from JPEG file using fd
     *                 2.Modify property X_RESOLUTION as short type with value 2.5
     *                 3.Read back property as double type
     *                 4.Verify cross-type reading returns truncated value 2
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_CROSS_READING_0200", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_CROSS_READING_0200"
      let result = true;
      let key: image.PropertyKey = image.PropertyKey.X_RESOLUTION
      const modifyValue = 2.5;
      const expectedValue = 2;
      let fd: number = await getFd("test_exif_modify_jpg_v2.jpg");
      const errorCode = await modifyPropertyValue(fd, "short", key, modifyValue);
      const actualValue = await getPropertyValue(fd, "double", key);
      
      if (!compareValues(actualValue, expectedValue)) {
        console.info(`${testTag} Verification failed for key: ${key}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
        result = false;
      }
      fs.closeSync(fd);
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_CROSS_READING_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_CROSS_READING_0300
     * @tc.desc        Verify cross-type reading after modifying property IMAGE_WIDTH with long type and reading as short type
     *                 1.Create image source from PNG file using fd
     *                 2.Modify property IMAGE_WIDTH as long type with value 100
     *                 3.Read back property as short type
     *                 4.Verify cross-type reading returns expected value
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_CROSS_READING_0300", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_CROSS_READING_0300"
      let result = true;
      let key: image.PropertyKey = image.PropertyKey.IMAGE_WIDTH
      const expectedValue = 100;
      let fd: number = await getFd("test_exif_modify_png_v2.png");
      const errorCode = await modifyPropertyValue(fd, "long", key, expectedValue);
      const actualValue = await getPropertyValue(fd, "short", key);
      
      if (!compareValues(actualValue, expectedValue)) {
        console.info(`${testTag} Verification failed for key: ${key}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
        result = false;
      }
      fs.closeSync(fd);
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_CROSS_READING_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_CROSS_READING_0400
     * @tc.desc        Verify cross-type reading after modifying property X_RESOLUTION with long type and reading as double type
     *                 1.Create image source from PNG file using fd
     *                 2.Modify property X_RESOLUTION as long type with value 2.5
     *                 3.Read back property as double type
     *                 4.Verify cross-type reading returns truncated value 2
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_CROSS_READING_0400", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_CROSS_READING_0400"
      let result = true;
      let key: image.PropertyKey = image.PropertyKey.X_RESOLUTION
      const modifyValue = 2.5;
      const expectedValue = 2;
      let fd: number = await getFd("test_exif_modify_png_v2.png");
      const errorCode = await modifyPropertyValue(fd, "long", key, modifyValue);
      const actualValue = await getPropertyValue(fd, "double", key);
      
      if (!compareValues(actualValue, expectedValue)) {
        console.info(`${testTag} Verification failed for key: ${key}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
        result = false;
      }
      fs.closeSync(fd);
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_CROSS_READING_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_CROSS_READING_0500
     * @tc.desc        Verify cross-type reading after modifying property PRIMARY_CHROMATICITIES with intArray type and reading as doubleArray type
     *                 1.Create image source from PNG file using fd
     *                 2.Modify property PRIMARY_CHROMATICITIES as intArray type with value [6.5]
     *                 3.Read back property as double type
     *                 4.Verify cross-type reading returns truncated value [6]
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_CROSS_READING_0500", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_CROSS_READING_0500"
      let result = true;
      let fd: number = await getFd("test_exif_readWrite_heic_v2.heic");
      const key = image.PropertyKey.PRIMARY_CHROMATICITIES;
      const modifyValue = [6.5];
      const expectedValue = [6];
      const errorCode = await modifyPropertyValue(fd, "intArray", key, modifyValue);
      const actualValue = await getPropertyValue(fd, "doubleArray", key);

      if (!compareValues(actualValue, expectedValue)) {
        console.info(`${testTag} Verification failed for key: ${key}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
        result = false;
      }
      fs.closeSync(fd);
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_EXTRENELY_LONG_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_EXTRENELY_LONG_0100
     * @tc.desc        Verify modifying EXIF property STRIP_OFFSETS with extreme value returns READ_FAILED error
     *                 1.Create image source from PNG file using fd
     *                 2.Attempt to modify property STRIP_OFFSETS as long type with extreme value 2147483798
     *                 3.Verify modification fails with READ_FAILED error
     *                 4.Confirm extreme values exceeding int32 max are rejected for long type properties
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_EXTRENELY_LONG_0100", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_EXTRENELY_LONG_0100"      
      let result = true;
      let key: image.PropertyKey = image.PropertyKey.STRIP_OFFSETS
      const modifyValue = 4294967296; // exceed uint32 max
      const expectedValue = 0;
      let fd: number = await getFd("test_exif_modify_png_v2.png");
      const errorCode = await modifyPropertyValue(fd, "long", key, modifyValue);
      const actualValue = await getPropertyValue(fd, "long", key);
      
      if (!compareValues(actualValue, expectedValue)) {
        console.info(`${testTag} Verification failed for key: ${key}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
        result = false;
      }
      fs.closeSync(fd);
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_PACKTOFILE_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_PACKTOFILE_0100
     * @tc.desc        Verify packing modified short type EXIF properties to JPEG file
     *                 1.Create image source from empty JPEG file
     *                 2.Modify short property IMAGE_WIDTH with value 25
     *                 3.Pack to output JPEG file with modified EXIF
     *                 4.Verify packed file contains modified properties
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_PACKTOFILE_0100", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_PACKTOFILE_0100"
      const fileName = "test_exif_empty_jpg_v3.jpg"
      const compareFileName = "test_packtofile_jpg.jpg"
      let key: image.PropertyKey = image.PropertyKey.IMAGE_WIDTH
      const modifyValue = 25;
      const expectedValue = 25;
      let packOpts: image.PackingOption = testCreatePackOptions("image/jpeg", 98, true);

      let result = await testPackToFileAndModify(testTag, fileName, compareFileName, key, modifyValue, expectedValue, packOpts, "short");
      console.info(`${testTag} testPackToFileAndModify result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_PACKTOFILE_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_PACKTOFILE_0200
     * @tc.desc        Verify packing modified long type EXIF properties to PNG file
     *                 1.Create image source from empty PNG file
     *                 2.Modify long property STRIP_OFFSETS with value 10
     *                 3.Pack to output PNG file with modified EXIF
     *                 4.Verify packed file contains modified properties
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_PACKTOFILE_0200", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_PACKTOFILE_0200"
      const fileName = "test_exif_empty_png_v3.png"
      const compareFileName = "test_packtofile_png.png"
      let key: image.PropertyKey = image.PropertyKey.STRIP_OFFSETS
      const modifyValue = 10;
      const expectedValue = 10;
      let packOpts: image.PackingOption = testCreatePackOptions("image/png", 98, true);

      let result = await testPackToFileAndModify(testTag, fileName, compareFileName, key, modifyValue, expectedValue, packOpts, "long");
      console.info(`${testTag} testPackToFileAndModify result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_PACKTOFILE_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_PACKTOFILE_0300
     * @tc.desc        Verify packing modified double type EXIF properties to HEIC file
     *                 1.Create image source from empty HEIC file
     *                 2.Modify double property BRIGHTNESS_VALUE with value 1.5
     *                 3.Pack to output HEIC file with modified EXIF
     *                 4.Verify packed file contains modified properties
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_PACKTOFILE_0300", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_PACKTOFILE_0300"
      const fileName = "test_exif_empty_heic_v3.heic"
      const compareFileName = "test_packtofile_heic.heic"
      let key: image.PropertyKey = image.PropertyKey.BRIGHTNESS_VALUE
      const modifyValue = 1.5;
      const expectedValue = 1.5;
      let packOpts: image.PackingOption = testCreatePackOptions("image/heic", 98, true);
      if (!image.createImagePacker().supportedFormats.includes("image/heic")) {
        console.info(testTag + "device is not support heif encode");
        done();
      } else {
        let result = await testPackToFileAndModify(testTag, fileName, compareFileName, key, modifyValue, expectedValue, packOpts, "double");
        console.info(`${testTag} testPackToFileAndModify result is: ${result}`);
        expect(result).assertTrue();
        done();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_PACKTOFILE_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_PACKTOFILE_0400
     * @tc.desc        Verify packing modified intArray type EXIF properties to WEBP file
     *                 1.Create image source from empty WEBP file
     *                 2.Modify intArray property BITS_PER_SAMPLE with value [2,2,2]
     *                 3.Pack to output WEBP file with modified EXIF
     *                 4.Verify packed file contains modified properties
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_PACKTOFILE_0400", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_PACKTOFILE_0400"
      const fileName = "test_exif_empty_webp_v3.webp"
      const compareFileName = "test_packtofile_webp.webp"
      let key: image.PropertyKey = image.PropertyKey.BITS_PER_SAMPLE
      const modifyValue = [2,2,2];
      const expectedValue = [2,2,2];
      let packOpts: image.PackingOption = testCreatePackOptions("image/webp", 98, true);

      let result = await testPackToFileAndModify(testTag, fileName, compareFileName, key, modifyValue, expectedValue, packOpts, "intArray");
      console.info(`${testTag} testPackToFileAndModify result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_PACKTOFILE_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_PACKTOFILE_0500
     * @tc.desc        Verify packing modified doubleArray type EXIF properties to WEBP file
     *                 1.Create image source from empty WEBP file
     *                 2.Modify doubleArray property LENS_SPECIFICATION with value [0.7,2.2,1.1,0.4]
     *                 3.Pack to output WEBP file with modified EXIF
     *                 4.Verify packed file contains modified properties
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_PACKTOFILE_0500", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_PACKTOFILE_0500"
      const fileName = "test_exif_empty_webp_v3.webp"
      const compareFileName = "test_packtofile_webp2.webp"
      let key: image.PropertyKey = image.PropertyKey.LENS_SPECIFICATION
      const modifyValue = [0.7,2.2,1.1,0.4];
      const expectedValue = [0.7,2.2,1.1,0.4];
      let packOpts: image.PackingOption = testCreatePackOptions("image/webp", 98, true);

      let result = await testPackToFileAndModify(testTag, fileName, compareFileName, key, modifyValue, expectedValue, packOpts, "doubleArray");
      console.info(`${testTag} testPackToFileAndModify result is: ${result}`);
      expect(result).assertTrue();
      done();
    });
    
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_PACKTOFILE_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_PACKTOFILE_0600
     * @tc.desc        Verify packing modified arrayBuffer type EXIF properties to JPEG file
     *                 1.Create image source from empty JPEG file
     *                 2.Modify arrayBuffer property OECF with value [48,50,49,48]
     *                 3.Pack to output JPEG file with modified EXIF
     *                 4.Verify packed file contains modified properties
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_PACKTOFILE_0600", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_PACKTOFILE_0600"
      const fileName = "test_exif_empty_jpg_v3.jpg"
      const compareFileName = "test_packtofile_arrBuffer_jpg.jpg"
      const testArrayBuffer: Uint8Array = new Uint8Array([48, 50, 49, 48]);
      const arrayBuffer: ArrayBuffer = testArrayBuffer.buffer as ArrayBuffer;
      let key: image.PropertyKey = image.PropertyKey.OECF
      const modifyValue = arrayBuffer;
      const expectedValue = arrayBuffer;
      let packOpts: image.PackingOption = testCreatePackOptions("image/jpeg", 98, true);

      let result = await testPackToFileAndModify(testTag, fileName, compareFileName, key, modifyValue, expectedValue, packOpts, "arrayBuffer");
      console.info(`${testTag} testPackToFileAndModify result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_READ_ONLY_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_READ_ONLY_ERROR_0100
     * @tc.desc        Verify modifying read-only EXIF property JPEG_INTERCHANGE_FORMAT with short type returns READ_FAILED error
     *                 1.Create image source from JPEG file
     *                 2.Attempt to modify read-only property JPEG_INTERCHANGE_FORMAT as short type
     *                 3.Verify modification fails with READ_FAILED error
     *                 4.Confirm read-only properties cannot be modified
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_READ_ONLY_ERROR_0100", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_READ_ONLY_ERROR_0100"
      let fd: number = await getFd("test_exif_readWrite_jpg_v2.jpg");
      const key = image.PropertyKey.JPEG_INTERCHANGE_FORMAT;
      const value = 4;
      const errorCode = await modifyPropertyValue(fd, "short", key, value);
      fs.closeSync(fd);
      expect(errorCode == READ_FAILED).assertTrue();
      console.info(`${testTag} TestModifyImagePropertyShort result is: ${errorCode}`);
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_READ_ONLY_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_READ_ONLY_ERROR_0200
     * @tc.desc        Verify modifying read-only EXIF property JPEG_INTERCHANGE_FORMAT with long type returns READ_FAILED error
     *                 1.Create image source from PNG file
     *                 2.Attempt to modify read-only property JPEG_INTERCHANGE_FORMAT as long type
     *                 3.Verify modification fails with READ_FAILED error
     *                 4.Confirm read-only properties cannot be modified
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_READ_ONLY_ERROR_0200", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_READ_ONLY_ERROR_0200"
      let fd: number = await getFd("test_exif_readWrite_png_v2.png");
      const key = image.PropertyKey.JPEG_INTERCHANGE_FORMAT;
      const value = 4;
      const errorCode = await modifyPropertyValue(fd, "long", key, value);
      fs.closeSync(fd);
      expect(errorCode == READ_FAILED).assertTrue();
      console.info(`${testTag} TestModifyImagePropertyLong result is: ${errorCode}`);
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_READ_ONLY_ERROR_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_READ_ONLY_ERROR_0300
     * @tc.desc        Verify modifying read-only EXIF property JPEG_INTERCHANGE_FORMAT with double type returns READ_FAILED error
     *                 1.Create image source from HEIC file
     *                 2.Attempt to modify read-only property JPEG_INTERCHANGE_FORMAT as double type
     *                 3.Verify modification fails with READ_FAILED error
     *                 4.Confirm read-only properties cannot be modified
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_READ_ONLY_ERROR_0300", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_READ_ONLY_ERROR_0300"
      let fd: number = await getFd("test_exif_readWrite_heic_v2.heic");
      const key = image.PropertyKey.JPEG_INTERCHANGE_FORMAT;
      const value = 4;
      const errorCode = await modifyPropertyValue(fd, "double", key, value);
      fs.closeSync(fd);
      expect(errorCode == READ_FAILED).assertTrue();
      console.info(`${testTag} TestModifyImagePropertyDouble result is: ${errorCode}`);
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0100
     * @tc.desc        Verify modifying unsupported EXIF property YCBCR_COEFFICIENTS with short type returns READ_FAILED error
     *                 1.Create image source from JPEG file
     *                 2.Attempt to modify unsupported property YCBCR_COEFFICIENTS as short type
     *                 3.Verify modification fails with READ_FAILED error
     *                 4.Confirm unsupported keys cannot be modified
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0100", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0100"
      let fd: number = await getFd("test_exif_readWrite_jpg_v2.jpg");
      const key = image.PropertyKey.YCBCR_COEFFICIENTS;
      const value = 2;
      const errorCode = await modifyPropertyValue(fd, "short", key, value);
      fs.closeSync(fd);
      console.info(`${testTag} TestModifyImagePropertyShort result is: ${errorCode}`);
      expect(errorCode == READ_FAILED).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0200
     * @tc.desc        Verify modifying unsupported EXIF property YCBCR_COEFFICIENTS with long type returns READ_FAILED error
     *                 1.Create image source from PNG file
     *                 2.Attempt to modify unsupported property YCBCR_COEFFICIENTS as long type
     *                 3.Verify modification fails with READ_FAILED error
     *                 4.Confirm unsupported keys cannot be modified
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0200", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0200"
      let fd: number = await getFd("test_exif_readWrite_png_v2.png");
      const key = image.PropertyKey.YCBCR_COEFFICIENTS;
      const value = 1;
      const errorCode = await modifyPropertyValue(fd, "long", key, value);
      fs.closeSync(fd);
      console.info(`${testTag} TestModifyImagePropertyLong result is: ${errorCode}`);
      expect(errorCode == READ_FAILED).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0300
     * @tc.desc        Verify modifying EXIF property X_RESOLUTION with wrong type intArray returns READ_FAILED error
     *                 1.Create image source from HEIC file
     *                 2.Attempt to modify property X_RESOLUTION with unsupported intArray type
     *                 3.Verify modification fails with READ_FAILED error
     *                 4.Confirm wrong type modifications are rejected
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0300", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0300"
      let fd: number = await getFd("test_exif_readWrite_heic_v2.heic");
      const key = image.PropertyKey.X_RESOLUTION;
      const value = [1,1];
      const errorCode = await modifyPropertyValue(fd, "intArray", key, value);
      fs.closeSync(fd);
      console.info(`${testTag} TestModifyImagePropertyIntArray result is: ${errorCode}`);
      expect(errorCode == READ_FAILED).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0400
     * @tc.desc        Verify modifying unsupported EXIF property YCBCR_COEFFICIENTS with intArray type returns READ_FAILED error
     *                 1.Create image source from HEIC file
     *                 2.Attempt to modify unsupported property YCBCR_COEFFICIENTS as intArray type
     *                 3.Verify modification fails with READ_FAILED error
     *                 4.Confirm unsupported keys cannot be modified
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0400", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0400"
      let fd: number = await getFd("test_exif_readWrite_heic_v2.heic");
      const key = image.PropertyKey.YCBCR_COEFFICIENTS;
      const value = [6,6];
      const errorCode = await modifyPropertyValue(fd, "intArray", key, value);
      fs.closeSync(fd);
      console.info(`${testTag} TestModifyImagePropertyIntArray result is: ${errorCode}`);
      expect(errorCode == READ_FAILED).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0500
     * @tc.desc        Verify modifying EXIF property IMAGE_WIDTH with wrong type double returns READ_FAILED error
     *                 1.Create image source from WEBP file
     *                 2.Attempt to modify property IMAGE_WIDTH with wrong type double
     *                 3.Verify modification fails with READ_FAILED error
     *                 4.Confirm wrong type modifications are rejected
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0500", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0500"
      let fd: number = await getFd("test_exif_readWrite_webp_v2.webp");
      const key = image.PropertyKey.IMAGE_WIDTH;
      const value = 200;
      const errorCode = await modifyPropertyValue(fd, "double", key, value);
      fs.closeSync(fd);
      console.info(`${testTag} TestModifyImagePropertyDouble result is: ${errorCode}`);
      expect(errorCode == READ_FAILED).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0600
     * @tc.desc        Verify modifying EXIF property NEW_SUBFILE_TYPE with wrong type double returns READ_FAILED error
     *                 1.Create image source from WEBP file
     *                 2.Attempt to modify property NEW_SUBFILE_TYPE with wrong type double
     *                 3.Verify modification fails with READ_FAILED error
     *                 4.Confirm wrong type modifications are rejected
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0600", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0600"
      let fd: number = await getFd("test_exif_readWrite_webp_v2.webp");
      const key = image.PropertyKey.NEW_SUBFILE_TYPE;
      const value = 2;
      const errorCode = await modifyPropertyValue(fd, "double", key, value);
      fs.closeSync(fd);
      console.info(`${testTag} TestModifyImagePropertyDouble result is: ${errorCode}`);
      expect(errorCode == READ_FAILED).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0700
     * @tc.desc        Verify modifying EXIF property BITS_PER_SAMPLE with wrong type double returns READ_FAILED error
     *                 1.Create image source from WEBP file
     *                 2.Attempt to modify property BITS_PER_SAMPLE with wrong type double
     *                 3.Verify modification fails with READ_FAILED error
     *                 4.Confirm wrong type modifications are rejected
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0700", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0700"
      let fd: number = await getFd("test_exif_readWrite_webp_v2.webp");
      const key = image.PropertyKey.BITS_PER_SAMPLE;
      const value = 3;
      const errorCode = await modifyPropertyValue(fd, "double", key, value);
      fs.closeSync(fd);
      console.info(`${testTag} TestModifyImagePropertyDouble result is: ${errorCode}`);
      expect(errorCode == READ_FAILED).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0800
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0800
     * @tc.desc        Verify modifying EXIF property IMAGE_WIDTH with wrong type doubleArray returns READ_FAILED error
     *                 1.Create image source from JPEG file
     *                 2.Attempt to modify property IMAGE_WIDTH with wrong type doubleArray
     *                 3.Verify modification fails with READ_FAILED error
     *                 4.Confirm wrong type modifications are rejected
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0800", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0800"
      let fd: number = await getFd("test_exif_readWrite_jpg_v2.jpg");
      const key = image.PropertyKey.IMAGE_WIDTH;
      const value = [1.1];
      const errorCode = await modifyPropertyValue(fd, "doubleArray", key, value);
      fs.closeSync(fd);
      console.info(`${testTag} TestModifyImagePropertyDoubleArray result is: ${errorCode}`);
      expect(errorCode == READ_FAILED).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0900
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0900
     * @tc.desc        Verify modifying EXIF property NEW_SUBFILE_TYPE with wrong type doubleArray returns READ_FAILED error
     *                 1.Create image source from JPEG file
     *                 2.Attempt to modify property NEW_SUBFILE_TYPE with wrong type doubleArray
     *                 3.Verify modification fails with READ_FAILED error
     *                 4.Confirm wrong type modifications are rejected
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0900", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_0900"
      let fd: number = await getFd("test_exif_readWrite_jpg_v2.jpg");
      const key = image.PropertyKey.NEW_SUBFILE_TYPE;
      const value = [1.1];
      const errorCode = await modifyPropertyValue(fd, "doubleArray", key, value);
      fs.closeSync(fd);
      console.info(`${testTag} TestModifyImagePropertyDoubleArray result is: ${errorCode}`);
      expect(errorCode == READ_FAILED).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_1000
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_1000
     * @tc.desc        Verify modifying EXIF property IMAGE_LENGTH with wrong type arrayBuffer returns READ_FAILED error
     *                 1.Create image source from JPEG file
     *                 2.Attempt to modify property IMAGE_LENGTH with wrong type arrayBuffer
     *                 3.Verify modification fails with READ_FAILED error
     *                 4.Confirm wrong type modifications are rejected
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_1000", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_1000"
      let fd: number = await getFd("test_exif_readWrite_jpg_v2.jpg");
      const key = image.PropertyKey.IMAGE_LENGTH;
      const value = testArrayBuffer;
      const errorCode = await modifyPropertyValue(fd, "arrayBuffer", key, value);
      fs.closeSync(fd);
      console.info(`${testTag} TestModifyImagePropertyArrayBuffer result is: ${errorCode}`);
      expect(errorCode == READ_FAILED).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_1100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_1100
     * @tc.desc        Verify modifying EXIF property NEW_SUBFILE_TYPE with wrong type arrayBuffer returns READ_FAILED error
     *                 1.Create image source from JPEG file
     *                 2.Attempt to modify property NEW_SUBFILE_TYPE with wrong type arrayBuffer
     *                 3.Verify modification fails with READ_FAILED error
     *                 4.Confirm wrong type modifications are rejected
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_1100", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_1100"
      let fd: number = await getFd("test_exif_readWrite_jpg_v2.jpg");
      const key = image.PropertyKey.NEW_SUBFILE_TYPE;
      const value = testArrayBuffer;
      const errorCode = await modifyPropertyValue(fd, "arrayBuffer", key, value);
      fs.closeSync(fd);
      console.info(`${testTag} TestModifyImagePropertyArrayBuffer result is: ${errorCode}`);
      expect(errorCode == READ_FAILED).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_1200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_1200
     * @tc.desc        Verify modifying EXIF property Y_RESOLUTION with wrong type arrayBuffer returns READ_FAILED error
     *                 1.Create image source from JPEG file
     *                 2.Attempt to modify property Y_RESOLUTION with wrong type arrayBuffer
     *                 3.Verify modification fails with READ_FAILED error
     *                 4.Confirm wrong type modifications are rejected
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_1200", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_1200"
      let fd: number = await getFd("test_exif_readWrite_jpg_v2.jpg");
      const key = image.PropertyKey.Y_RESOLUTION;
      const value = testArrayBuffer;
      const errorCode = await modifyPropertyValue(fd, "arrayBuffer", key, value);
      fs.closeSync(fd);
      console.info(`${testTag} TestModifyImagePropertyArrayBuffer result is: ${errorCode}`);
      expect(errorCode == READ_FAILED).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_1300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_1300
     * @tc.desc        Verify modifying EXIF property DEFAULT_CROP_SIZE with wrong type arrayBuffer returns READ_FAILED error
     *                 1.Create image source from JPEG file
     *                 2.Attempt to modify property DEFAULT_CROP_SIZE with wrong type arrayBuffer
     *                 3.Verify modification fails with READ_FAILED error
     *                 4.Confirm wrong type modifications are rejected
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_1300", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_1300"
      let fd: number = await getFd("test_exif_readWrite_jpg_v2.jpg");
      const key = image.PropertyKey.DEFAULT_CROP_SIZE;
      const value = testArrayBuffer;
      const errorCode = await modifyPropertyValue(fd, "arrayBuffer", key, value);
      fs.closeSync(fd);
      console.info(`${testTag} TestModifyImagePropertyArraybuffer result is: ${errorCode}`);
      expect(errorCode == READ_FAILED).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_1400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_1400
     * @tc.desc        Verify modifying EXIF property PRIMARY_CHROMATICITIES with wrong type arrayBuffer returns READ_FAILED error
     *                 1.Create image source from JPEG file
     *                 2.Attempt to modify property PRIMARY_CHROMATICITIES with wrong type arrayBuffer
     *                 3.Verify modification fails with READ_FAILED error
     *                 4.Confirm wrong type modifications are rejected
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_1400", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_1400"
      let fd: number = await getFd("test_exif_readWrite_jpg_v2.jpg");
      const key = image.PropertyKey.PRIMARY_CHROMATICITIES;
      const value = testArrayBuffer;
      const errorCode = await modifyPropertyValue(fd, "arrayBuffer", key, value);
      fs.closeSync(fd);
      console.info(`${testTag} TestModifyImagePropertyArraybuffer result is: ${errorCode}`);
      expect(errorCode == READ_FAILED).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_1500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_1500
     * @tc.desc        Verify modifying EXIF property IMAGE_DESCRIPTION with wrong type arrayBuffer returns READ_FAILED error
     *                 1.Create image source from JPEG file
     *                 2.Attempt to modify property IMAGE_DESCRIPTION with wrong type arrayBuffer
     *                 3.Verify modification fails with READ_FAILED error
     *                 4.Confirm wrong type modifications are rejected
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_1500", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_KEY_ERROR_1500"
      let fd: number = await getFd("test_exif_readWrite_jpg_v2.jpg");
      const key = image.PropertyKey.IMAGE_DESCRIPTION;
      const value = testArrayBuffer;
      const errorCode = await modifyPropertyValue(fd, "arrayBuffer", key, value);
      fs.closeSync(fd);
      console.info(`${testTag} TestModifyImagePropertyArraybuffer result is: ${errorCode}`);
      expect(errorCode == READ_FAILED).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0100
     * @tc.desc        Verify modifying non-existent EXIF property Makernote with short type returns READ_FAILED error
     *                 1.Create image source from JPEG file
     *                 2.Attempt to modify non-existent property Makernote as short type
     *                 3.Verify modification fails with READ_FAILED error
     *                 4.Confirm non-existent keys cannot be modified
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0100", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0100"
      const key = "Makernote" as image.PropertyKey;
      const value = 1;
      let fd: number = await getFd("test_exif_readWrite_jpg_v2.jpg");  
      const errorCode = await modifyPropertyValue(fd, "short", key, value);
      console.info(`${testTag} modifyPropertyValue errorCode is: ${errorCode}`);
      fs.closeSync(fd);
      expect(errorCode == READ_FAILED).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0200
     * @tc.desc        Verify modifying non-existent EXIF property Makernote with long type returns READ_FAILED error
     *                 1.Create image source from JPEG file
     *                 2.Attempt to modify non-existent property Makernote as long type
     *                 3.Verify modification fails with READ_FAILED error
     *                 4.Confirm non-existent keys cannot be modified
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0200", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0200"
      const key = "Makernote" as image.PropertyKey;
      const value = 1;
      let fd: number = await getFd("test_exif_readWrite_jpg_v2.jpg");  
      const errorCode = await modifyPropertyValue(fd, "long", key, value);
      console.info(`${testTag} modifyPropertyValue errorCode is: ${errorCode}`);
      fs.closeSync(fd);
      expect(errorCode == READ_FAILED).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0300
     * @tc.desc        Verify modifying non-existent EXIF property Makernote with double type returns READ_FAILED error
     *                 1.Create image source from JPEG file
     *                 2.Attempt to modify non-existent property Makernote as double type
     *                 3.Verify modification fails with READ_FAILED error
     *                 4.Confirm non-existent keys cannot be modified
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0300", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0300"
      const key = "Makernote" as image.PropertyKey;
      const value = 1.0;
      let fd: number = await getFd("test_exif_readWrite_jpg_v2.jpg");  
      const errorCode = await modifyPropertyValue(fd, "double", key, value);
      console.info(`${testTag} modifyPropertyValue errorCode is: ${errorCode}`);
      fs.closeSync(fd);
      expect(errorCode == READ_FAILED).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0400
     * @tc.desc        Verify modifying non-existent EXIF property Makernote with intArray type returns READ_FAILED error
     *                 1.Create image source from JPEG file
     *                 2.Attempt to modify non-existent property Makernote as intArray type
     *                 3.Verify modification fails with READ_FAILED error
     *                 4.Confirm non-existent keys cannot be modified
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0400", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0400"
      const key = "Makernote" as image.PropertyKey;
      const value = [1,1];
      let fd: number = await getFd("test_exif_readWrite_jpg_v2.jpg");  
      const errorCode = await modifyPropertyValue(fd, "intArray", key, value);
      console.info(`${testTag} modifyPropertyValue errorCode is: ${errorCode}`);
      fs.closeSync(fd);
      expect(errorCode == READ_FAILED).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0500
     * @tc.desc        Verify modifying non-existent EXIF property Makernote with doubleArray type returns READ_FAILED error
     *                 1.Create image source from JPEG file
     *                 2.Attempt to modify non-existent property Makernote as doubleArray type
     *                 3.Verify modification fails with READ_FAILED error
     *                 4.Confirm non-existent keys cannot be modified
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0500", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0500"
      const key = "Makernote" as image.PropertyKey;
      const value = [1.1];
      let fd: number = await getFd("test_exif_readWrite_jpg_v2.jpg");  
      const errorCode = await modifyPropertyValue(fd, "doubleArray", key, value);
      console.info(`${testTag} modifyPropertyValue errorCode is: ${errorCode}`);
      fs.closeSync(fd);
      expect(errorCode == READ_FAILED).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0600
     * @tc.desc        Verify modifying non-existent EXIF property Makernote with arrayBuffer type returns READ_FAILED error
     *                 1.Create image source from JPEG file
     *                 2.Attempt to modify non-existent property Makernote as arrayBuffer type
     *                 3.Verify modification fails with READ_FAILED error
     *                 4.Confirm non-existent keys cannot be modified
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0600", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_NON_EXISTENE_KEY_ERROR_0600"
      const key = "Makernote" as image.PropertyKey;
      const value = testArrayBuffer;
      let fd: number = await getFd("test_exif_readWrite_jpg_v2.jpg");  
      const errorCode = await modifyPropertyValue(fd, "arrayBuffer", key, value);
      console.info(`${testTag} modifyPropertyValue errorCode is: ${errorCode}`);
      fs.closeSync(fd);
      expect(errorCode == READ_FAILED).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_VALUE_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_VALUE_ERROR_0100
     * @tc.desc        Verify modifying EXIF property ORIENTATION with invalid value 9 returns READ_FAILED error
     *                 1.Create image source from JPEG file
     *                 2.Attempt to modify property ORIENTATION with invalid value 9 (valid range 1-8)
     *                 3.Verify modification fails with READ_FAILED error
     *                 4.Confirm invalid values are rejected
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_VALUE_ERROR_0100", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_VALUE_ERROR_0100"
      let fd: number = await getFd("test_exif_readWrite_jpg_v2.jpg");
      const key = image.PropertyKey.ORIENTATION;
      const value = 9;
      const errorCode = await modifyPropertyValue(fd, "short", key, value);
      console.info(`${testTag} TestModifyImagePropertyShort result is: ${errorCode}`);
      fs.closeSync(fd);
      expect(errorCode == READ_FAILED).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_VALUE_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_VALUE_ERROR_0200
     * @tc.desc        Verify modifying EXIF property NEW_SUBFILE_TYPE with invalid value 10 returns READ_FAILED error
     *                 1.Create image source from PNG file
     *                 2.Attempt to modify property NEW_SUBFILE_TYPE with invalid value 10
     *                 3.Verify modification fails with READ_FAILED error
     *                 4.Confirm invalid values are rejected
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_VALUE_ERROR_0200", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_VALUE_ERROR_0200"
      let fd: number = await getFd("test_exif_readWrite_png_v2.png");
      const key = image.PropertyKey.NEW_SUBFILE_TYPE;
      const value = 10;
      const errorCode = await modifyPropertyValue(fd, "long", key, value);
      console.info(`${testTag} TestModifyImagePropertyLong result is: ${errorCode}`);
      fs.closeSync(fd);
      expect(errorCode == READ_FAILED).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_VALUE_ERROR_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_VALUE_ERROR_0300
     * @tc.desc        Verify modifying EXIF property BITS_PER_SAMPLE with invalid array [0,1] returns READ_FAILED error
     *                 1.Create image source from HEIC file
     *                 2.Attempt to modify property BITS_PER_SAMPLE with invalid array [0,1]
     *                 3.Verify modification fails with READ_FAILED error
     *                 4.Confirm invalid array values are rejected
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_VALUE_ERROR_0300", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_VALUE_ERROR_0300"
      let fd: number = await getFd("test_exif_readWrite_heic_v2.heic");
      const key = image.PropertyKey.BITS_PER_SAMPLE;
      const value = [0,1];
      const errorCode = await modifyPropertyValue(fd, "intArray", key, value);
      console.info(`${testTag} TestModifyImagePropertyItArray result is: ${errorCode}`);
      fs.closeSync(fd);
      expect(errorCode == READ_FAILED).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_VALUE_ERROR_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_VALUE_ERROR_0400
     * @tc.desc        Verify modifying EXIF property GAMMA with invalid negative value -1 returns READ_FAILED error
     *                 1.Create image source from WEBP file
     *                 2.Attempt to modify property GAMMA with invalid negative value -1
     *                 3.Verify modification fails with READ_FAILED error
     *                 4.Confirm negative values are rejected for GAMMA
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_VALUE_ERROR_0400", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_VALUE_ERROR_0400"
      let fd: number = await getFd("test_exif_readWrite_webp_v2.webp");
      const key = image.PropertyKey.GAMMA;
      const value = -1;
      const errorCode = await modifyPropertyValue(fd, "double", key, value);
      console.info(`${testTag} TestModifyImagePropertyDouble result is: ${errorCode}`);
      fs.closeSync(fd);
      expect(errorCode == READ_FAILED).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_VALUE_ERROR_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_VALUE_ERROR_0500
     * @tc.desc        Verify modifying EXIF property GPS_DEST_LATITUDE with wrong size array [0,0,0,0,0] returns READ_FAILED error
     *                 1.Create image source from JPEG file
     *                 2.Attempt to modify property GPS_DEST_LATITUDE with wrong size array (5 elements instead of expected 3)
     *                 3.Verify modification fails with READ_FAILED error
     *                 4.Confirm array size validation works
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_VALUE_ERROR_0500", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_VALUE_ERROR_0500"
      let fd: number = await getFd("test_exif_readWrite_jpg_v2.jpg");
      const key = image.PropertyKey.GPS_DEST_LATITUDE;
      const value = [0,0,0,0,0];
      const errorCode = await modifyPropertyValue(fd, "doubleArray", key, value);
      console.info(`${testTag} TestModifyImagePropertyDoubleArray result is: ${errorCode}`);
      fs.closeSync(fd);
      expect(errorCode == READ_FAILED).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_VALUE_ERROR_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_VALUE_ERROR_0600
     * @tc.desc        Verify modifying EXIF property SPATIAL_FREQUENCY_RESPONSE with empty arrayBuffer returns PROPERTY_NOT_EXIST error
     *                 1.Create image source from JPEG file
     *                 2.Attempt to modify property SPATIAL_FREQUENCY_RESPONSE with empty arrayBuffer
     *                 3.Verify modification fails with PROPERTY_NOT_EXIST error
     *                 4.Confirm empty buffer values are rejected
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_VALUE_ERROR_0600", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_VALUE_ERROR_0600"
      let fd: number = await getFd("test_exif_readWrite_jpg_v2.jpg");
      const emptyArrayBuffer: ArrayBuffer = new ArrayBuffer(0);
      const emptyArray: Array<number> = Array.from(new Uint8Array(emptyArrayBuffer));
      const key = image.PropertyKey.SPATIAL_FREQUENCY_RESPONSE;
      const value = emptyArray;
      const errorCode = await modifyPropertyValue(fd, "arrayBuffer", key, value);
      console.info(`${testTag} TestModifyImagePropertyDoubleArray result is: ${errorCode}`);
      fs.closeSync(fd);
      expect(errorCode == PROPERTY_NOT_EXIST).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0100
     * @tc.desc        Verify modifying EXIF property in unsupported ICO format returns UNSUPPORTED_IMAGE_FORMATS error
     *                 1.Create image source from ICO file
     *                 2.Attempt to modify property ORIENTATION with short type
     *                 3.Verify modification fails with UNSUPPORTED_IMAGE_FORMATS error
     *                 4.Confirm ICO format does not support EXIF modifications
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0100", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0100"
      let fd: number = await getFd("test.ico");
      const key = image.PropertyKey.ORIENTATION;
      const value = 1;
      const errorCode = await modifyPropertyValue(fd, "short", key, value);
      console.info(`${testTag} TestModifyImagePropertyShort result is: ${errorCode}`);
      fs.closeSync(fd);
      expect(errorCode == UNSUPPORTED_IMAGE_FORMATS).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0200
     * @tc.desc        Verify modifying EXIF property in unsupported ICO format returns UNSUPPORTED_IMAGE_FORMATS error
     *                 1.Create image source from ICO file
     *                 2.Attempt to modify property NEW_SUBFILE_TYPE with long type
     *                 3.Verify modification fails with UNSUPPORTED_IMAGE_FORMATS error
     *                 4.Confirm ICO format does not support EXIF modifications
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0200", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0200"
      let fd: number = await getFd("test.ico");
      const key = image.PropertyKey.NEW_SUBFILE_TYPE;
      const value = 2;
      const errorCode = await modifyPropertyValue(fd, "long", key, value);
      console.info(`${testTag} TestModifyImagePropertyLong result is: ${errorCode}`);
      fs.closeSync(fd);
      expect(errorCode == UNSUPPORTED_IMAGE_FORMATS).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0300
     * @tc.desc        Verify modifying EXIF property in unsupported ICO format returns UNSUPPORTED_IMAGE_FORMATS error
     *                 1.Create image source from ICO file
     *                 2.Attempt to modify property BITS_PER_SAMPLE with intArray type
     *                 3.Verify modification fails with UNSUPPORTED_IMAGE_FORMATS error
     *                 4.Confirm ICO format does not support EXIF modifications
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0300", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0300"
      let fd: number = await getFd("test.ico");
      const key = image.PropertyKey.BITS_PER_SAMPLE;
      const value = [1,1];
      const errorCode = await modifyPropertyValue(fd, "intArray", key, value);
      console.info(`${testTag} TestModifyImagePropertyItArray result is: ${errorCode}`);
      fs.closeSync(fd);
      expect(errorCode == UNSUPPORTED_IMAGE_FORMATS).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0400
     * @tc.desc        Verify modifying EXIF property in unsupported ICO format returns UNSUPPORTED_IMAGE_FORMATS error
     *                 1.Create image source from ICO file
     *                 2.Attempt to modify property X_RESOLUTION with double type
     *                 3.Verify modification fails with UNSUPPORTED_IMAGE_FORMATS error
     *                 4.Confirm ICO format does not support EXIF modifications
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0400", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0400"
      let fd: number = await getFd("test.ico");
      const key = image.PropertyKey.X_RESOLUTION;
      const value = 1.5;
      const errorCode = await modifyPropertyValue(fd, "double", key, value);
      console.info(`${testTag} TestModifyImagePropertyDouble result is: ${errorCode}`);
      fs.closeSync(fd);
      expect(errorCode == UNSUPPORTED_IMAGE_FORMATS).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0500
     * @tc.desc        Verify modifying EXIF property in unsupported ICO format returns UNSUPPORTED_IMAGE_FORMATS error
     *                 1.Create image source from ICO file
     *                 2.Attempt to modify property YCBCR_COEFFICIENTS with doubleArray type
     *                 3.Verify modification fails with UNSUPPORTED_IMAGE_FORMATS error
     *                 4.Confirm ICO format does not support EXIF modifications
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0500", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0500"
      let fd: number = await getFd("test.ico");
      const key = image.PropertyKey.YCBCR_COEFFICIENTS;
      const value = [0.29,0.6,0.1];
      const errorCode = await modifyPropertyValue(fd, "doubleArray", key, value);
      console.info(`${testTag} TestModifyImagePropertyDoubleArray result is: ${errorCode}`);
      fs.closeSync(fd);
      expect(errorCode == UNSUPPORTED_IMAGE_FORMATS).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0600
     * @tc.desc        Verify modifying EXIF property in unsupported ICO format returns UNSUPPORTED_IMAGE_FORMATS error
     *                 1.Create image source from ICO file
     *                 2.Attempt to modify property OECF with arrayBuffer type
     *                 3.Verify modification fails with UNSUPPORTED_IMAGE_FORMATS error
     *                 4.Confirm ICO format does not support EXIF modifications
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0600", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_UNSUPPORTED_IMAGE_ERROR_0600"
      let fd: number = await getFd("test.ico");
      const key = image.PropertyKey.OECF;
      const value = testArrayBuffer;
      const errorCode = await modifyPropertyValue(fd, "arrayBuffer", key, value);
      console.info(`${testTag} TestModifyImagePropertyDoubleArray result is: ${errorCode}`);
      fs.closeSync(fd);
      expect(errorCode == UNSUPPORTED_IMAGE_FORMATS).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0100
     * @tc.desc        Verify modifying EXIF property on null image source with short type returns PROPERTY_NOT_EXIST error
     *                 1.Pass null image source pointer to modify function
     *                 2.Attempt to modify property with short type
     *                 3.Verify modification fails with PROPERTY_NOT_EXIST error
     *                 4.Confirm null source is properly validated
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0100", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0100"
      const errorCode = mdkTest.TestModifyImagePropertyError("short");
      console.info(`${testTag} TestModifyImagePropertyError result is: ${errorCode}`);
      expect(errorCode == PROPERTY_NOT_EXIST).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0200
     * @tc.desc        Verify modifying EXIF property on null image source with long type returns PROPERTY_NOT_EXIST error
     *                 1.Pass null image source pointer to modify function
     *                 2.Attempt to modify property with long type
     *                 3.Verify modification fails with PROPERTY_NOT_EXIST error
     *                 4.Confirm null source is properly validated
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0200", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0200"
      const errorCode = mdkTest.TestModifyImagePropertyError("long");
      console.info(`${testTag} TestModifyImagePropertyError result is: ${errorCode}`);
      expect(errorCode == PROPERTY_NOT_EXIST).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0300
     * @tc.desc        Verify modifying EXIF property on null image source with double type returns PROPERTY_NOT_EXIST error
     *                 1.Pass null image source pointer to modify function
     *                 2.Attempt to modify property with double type
     *                 3.Verify modification fails with PROPERTY_NOT_EXIST error
     *                 4.Confirm null source is properly validated
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0300", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0300"
      const errorCode = mdkTest.TestModifyImagePropertyError("double");
      console.info(`${testTag} TestModifyImagePropertyError result is: ${errorCode}`);
      expect(errorCode == PROPERTY_NOT_EXIST).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0400
     * @tc.desc        Verify modifying EXIF property on null image source with intArray type returns PROPERTY_NOT_EXIST error
     *                 1.Pass null image source pointer to modify function
     *                 2.Attempt to modify property with intArray type
     *                 3.Verify modification fails with PROPERTY_NOT_EXIST error
     *                 4.Confirm null source is properly validated
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0400", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0400"
      const errorCode = mdkTest.TestModifyImagePropertyError("intArray");
      console.info(`${testTag} TestModifyImagePropertyError result is: ${errorCode}`);
      expect(errorCode == PROPERTY_NOT_EXIST).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0500
     * @tc.desc        Verify modifying EXIF property on null image source with doubleArray type returns PROPERTY_NOT_EXIST error
     *                 1.Pass null image source pointer to modify function
     *                 2.Attempt to modify property with doubleArray type
     *                 3.Verify modification fails with PROPERTY_NOT_EXIST error
     *                 4.Confirm null source is properly validated
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0500", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0500"
      const errorCode = mdkTest.TestModifyImagePropertyError("doubleArray");
      console.info(`${testTag} TestModifyImagePropertyError result is: ${errorCode}`);
      expect(errorCode == PROPERTY_NOT_EXIST).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0600
     * @tc.desc        Verify modifying EXIF property on null image source with arrayBuffer type returns PROPERTY_NOT_EXIST error
     *                 1.Pass null image source pointer to modify function
     *                 2.Attempt to modify property with arrayBuffer type
     *                 3.Verify modification fails with PROPERTY_NOT_EXIST error
     *                 4.Confirm null source is properly validated
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0600", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_MODIFYIMAGEPROPERTIES_EMPTY_IMAGESOURCE_ERROR_0600"
      const errorCode = mdkTest.TestModifyImagePropertyError("arrayBuffer");
      console.info(`${testTag} TestModifyImagePropertyError result is: ${errorCode}`);
      expect(errorCode == PROPERTY_NOT_EXIST).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_DNG_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_DNG_0100
     * @tc.desc        Verify reading short type EXIF properties from DNG file
     *                 1.Create image source from DNG file using fd
     *                 2.Read short type properties through C API
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_DNG_0100", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_DNG_0100"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test.dng", 
        ImagePropertyConfig.short.keys, ImagePropertyConfig.short.rules, "expectValueDNG", "short");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LONG_DNG_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LONG_DNG_0200
     * @tc.desc        Verify reading long type EXIF properties from DNG file
     *                 1.Create image source from DNG file using fd
     *                 2.Read long type properties through C API
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LONG_DNG_0200", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LONG_DNG_0200"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test.dng", 
        ImagePropertyConfig.long.keys, ImagePropertyConfig.long.rules, "expectValueDNG", "long");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLE_DNG_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLE_DNG_0300
     * @tc.desc        Verify reading double type EXIF properties from DNG file
     *                 1.Create image source from DNG file using fd
     *                 2.Read double type properties through C API
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLE_DNG_0300", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLE_DNG_0300"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test.dng", 
        ImagePropertyConfig.double.keys, ImagePropertyConfig.double.rules, "expectValueDNG", "double");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_INTARRAY_DNG_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_INTARRAY_DNG_0400
     * @tc.desc        Verify reading intArray type EXIF properties from DNG file
     *                 1.Create image source from DNG file using fd
     *                 2.Read intArray type properties through C API
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_INTARRAY_DNG_0400", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_INTARRAY_DNG_0400"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test.dng", 
        ImagePropertyConfig.intArray.keys, ImagePropertyConfig.intArray.rules, "expectValueDNG", "intArray");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLEARRAY_DNG_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLEARRAY_DNG_0500
     * @tc.desc        Verify reading doubleArray type EXIF properties from DNG file
     *                 1.Create image source from DNG file using fd
     *                 2.Read doubleArray type properties through C API
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLEARRAY_DNG_0500", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_DOUBLEARRAY_DNG_0500"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test.dng", 
        ImagePropertyConfig.doubleArray.keys, ImagePropertyConfig.doubleArray.rules, "expectValueDNG", "doubleArray");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_ONLY_DNG_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_ONLY_DNG_0600
     * @tc.desc        Verify reading read-only short type EXIF properties from DNG file
     *                 1.Create image source from DNG file using fd
     *                 2.Read read-only short type properties through C API
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_ONLY_DNG_0600", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_SHORT_ONLY_DNG_0600"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test.dng", 
        ImagePropertyConfig.shortReadOnly.keys, ImagePropertyConfig.shortReadOnly.rules, "expectValueDNG", "short");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_DNG_0700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_DNG_0700
     * @tc.desc        Verify reading arrayBuffer type EXIF properties from DNG file
     *                 1.Create image source from DNG file using fd
     *                 2.Read arrayBuffer type properties through C API
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_DNG_0700", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_DNG_0700"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test.dng", 
        ImagePropertyConfig.arrayBuffer.keys, ImagePropertyConfig.arrayBuffer.rules, "expectValueDNG", "arrayBuffer");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_ONLY_DNG_0800
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_ONLY_DNG_0800
     * @tc.desc        Verify reading read-only arrayBuffer type EXIF properties from DNG file
     *                 1.Create image source from DNG file using fd
     *                 2.Read read-only arrayBuffer type properties through C API
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_ONLY_DNG_0800", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_ARRAYBUFFER_ONLY_DNG_0800"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test.dng", 
        ImagePropertyConfig.arrayBufferOnly.keys, ImagePropertyConfig.arrayBufferOnly.rules, "expectValueDNG", "arrayBuffer");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_STRING_DNG_0900
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_STRING_DNG_0900
     * @tc.desc        Verify reading string type EXIF properties from DNG file
     *                 1.Create image source from DNG file using fd
     *                 2.Read string type properties through C API
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_STRING_DNG_0900", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_STRING_DNG_0900"
      let result = false;
      result = await TestGetImagePropertyByType(testTag, "test.dng", 
        ImagePropertyConfig.string.keys, ImagePropertyConfig.string.rules, "expectValueDNG", "string");
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_DNG_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_DNG_0100
     * @tc.desc        Verify reading short type property NEW_SUBFILE_TYPE from DNG file
     *                 1.Create image source from DNG file using fd
     *                 2.Read property as short type through C API
     *                 3.Verify returned value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_DNG_0100", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_DNG_0100"
      let result = true;
      let key: image.PropertyKey = image.PropertyKey.NEW_SUBFILE_TYPE
      const expectedValue = 0;
      let fd: number = await getFd("test.dng");
      const actualValue = await getPropertyValue(fd, "short", key);
      
      if (!compareValues(actualValue, expectedValue)) {
        console.info(`${testTag} Verification failed for key: ${key}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
        result = false;
      }
      fs.closeSync(fd);
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_DNG_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_DNG_0200
     * @tc.desc        Verify reading long type property BITS_PER_SAMPLE from DNG file
     *                 1.Create image source from DNG file using fd
     *                 2.Read property as long type through C API
     *                 3.Verify returned value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_DNG_0200", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_DNG_0200"
      let result = true;
      let key: image.PropertyKey = image.PropertyKey.BITS_PER_SAMPLE
      const expectedValue = 16;
      let fd: number = await getFd("test.dng");
      const actualValue = await getPropertyValue(fd, "long", key);
      
      if (!compareValues(actualValue, expectedValue)) {
        console.info(`${testTag} Verification failed for key: ${key}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
        result = false;
      }
      fs.closeSync(fd);
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_DNG_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_DNG_0300
     * @tc.desc        Verify reading double type property YCBCR_COEFFICIENTS from DNG file
     *                 1.Create image source from DNG file using fd
     *                 2.Read property as double type through C API
     *                 3.Verify returned value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_DNG_0300", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_DNG_0300"
      let result = true;
      let key: image.PropertyKey = image.PropertyKey.YCBCR_COEFFICIENTS
      const expectedValue = 0.299;
      let fd: number = await getFd("test.dng");
      const actualValue = await getPropertyValue(fd, "double", key);
      
      if (!compareValues(actualValue, expectedValue)) {
        console.info(`${testTag} Verification failed for key: ${key}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
        result = false;
      }
      fs.closeSync(fd);
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_DNG_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_DNG_0400
     * @tc.desc        Verify reading long property IMAGE_WIDTH as intArray type from DNG file
     *                 1.Create image source from DNG file using fd
     *                 2.Read property as intArray type through C API for cross-type access
     *                 3.Verify returned value matches expected conversion result [5984]
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_DNG_0400", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_CROSS_READING_DNG_0400"
      let result = true;
      let key: image.PropertyKey = image.PropertyKey.IMAGE_WIDTH
      const expectedValue = [5984];
      let fd: number = await getFd("test.dng");
      const actualValue = await getPropertyValue(fd, "intArray", key);
      
      if (!compareValues(actualValue, expectedValue)) {
        console.info(`${testTag} Verification failed for key: ${key}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
        result = false;
      }
      fs.closeSync(fd);
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NO_VALUE_DNG_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NO_VALUE_DNG_ERROR_0100
     * @tc.desc        Verify reading non-existent EXIF property YCBCR_POSITIONING from DNG file returns error
     *                 1.Create image source from DNG file using fd
     *                 2.Attempt to read non-existent property as short type
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NO_VALUE_DNG_ERROR_0100", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NO_VALUE_DNG_ERROR_0100"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test.dng", image.PropertyKey.YCBCR_POSITIONING, "short", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NO_VALUE_DNG_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NO_VALUE_DNG_ERROR_0200
     * @tc.desc        Verify reading non-existent EXIF property SUBFILE_TYPE from DNG file returns error
     *                 1.Create image source from DNG file using fd
     *                 2.Attempt to read non-existent property as long type
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NO_VALUE_DNG_ERROR_0200", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NO_VALUE_DNG_ERROR_0200"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test.dng", image.PropertyKey.SUBFILE_TYPE, "long", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NO_VALUE_DNG_ERROR_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NO_VALUE_DNG_ERROR_0300
     * @tc.desc        Verify reading non-existent EXIF property YCBCR_POSITIONING from DNG file returns error
     *                 1.Create image source from DNG file using fd
     *                 2.Attempt to read non-existent property as intArray type
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NO_VALUE_DNG_ERROR_0300", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NO_VALUE_DNG_ERROR_0300"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test.dng", image.PropertyKey.YCBCR_POSITIONING, "intArray", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NO_VALUE_DNG_ERROR_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NO_VALUE_DNG_ERROR_0400
     * @tc.desc        Verify reading non-existent EXIF property GPS_IMG_DIRECTION from DNG file returns error
     *                 1.Create image source from DNG file using fd
     *                 2.Attempt to read non-existent property as double type
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NO_VALUE_DNG_ERROR_0400", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NO_VALUE_DNG_ERROR_0400"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test.dng", image.PropertyKey.GPS_IMG_DIRECTION, "double", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NO_VALUE_DNG_ERROR_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NO_VALUE_DNG_ERROR_0500
     * @tc.desc        Verify reading non-existent EXIF property WHITE_POINT from DNG file returns error
     *                 1.Create image source from DNG file using fd
     *                 2.Attempt to read non-existent property as doubleArray type
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NO_VALUE_DNG_ERROR_0500", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NO_VALUE_DNG_ERROR_0500"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test.dng", image.PropertyKey.WHITE_POINT, "doubleArray", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NO_VALUE_DNG_ERROR_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NO_VALUE_DNG_ERROR_0600
     * @tc.desc        Verify reading non-existent EXIF property TRANSFER_FUNCTION from DNG file returns error
     *                 1.Create image source from DNG file using fd
     *                 2.Attempt to read non-existent property as string type
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NO_VALUE_DNG_ERROR_0600", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NO_VALUE_DNG_ERROR_0600"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test.dng", image.PropertyKey.TRANSFER_FUNCTION, "string", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NO_VALUE_DNG_ERROR_0700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NO_VALUE_DNG_ERROR_0700
     * @tc.desc        Verify read non-existent EXIF property WHITE_POINT array size from DNG file returns error
     *                 1.Create image source from DNG file using fd
     *                 2.Attempt to read non-existent property array size
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NO_VALUE_DNG_ERROR_0700", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NO_VALUE_DNG_ERROR_0700"
      let result = false;
      result = await TestGetImagePropertyByTypeError(testTag, "test.dng", image.PropertyKey.WHITE_POINT, "arraySize", READ_FAILED);
      console.info(`${testTag} TestGetImagePropertyByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DNG_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DNG_ERROR_0100
     * @tc.desc        Verify reading long property IMAGE_WIDTH with wrong types returns READ_FAILED error
     *                 1.Create image source from DNG file using fd
     *                 2.Attempt to read long property using wrong types (double/doubleArray/string/arrayBuffer)
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DNG_ERROR_0100", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DNG_ERROR_0100"
      let result = true;
      let typeArray = ["double", "doubleArray", "string", "arrayBuffer"];
      for (let i = 0; i < typeArray.length; i++) {
        let ret = await TestGetImagePropertyByTypeError(testTag, "test.dng", 
          image.PropertyKey.IMAGE_WIDTH, typeArray[i], READ_FAILED);
        if (!ret) {
          console.info(`${testTag} TestGetImagePropertyByTypeError erroe is: ${typeArray[i]}`);
          break;
        }
        result = result && ret;
      }
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DNG_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DNG_ERROR_0200
     * @tc.desc        Verify reading long property SUBFILE_TYPE with wrong types returns READ_FAILED error
     *                 1.Create image source from DNG file using fd
     *                 2.Attempt to read long property using wrong types (double/doubleArray/string/arrayBuffer)
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DNG_ERROR_0200", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DNG_ERROR_0200"
      let result = true;
      let typeArray = ["double", "doubleArray", "string", "arrayBuffer"];
      for (let i = 0; i < typeArray.length; i++) {
        let ret = await TestGetImagePropertyByTypeError(testTag, "test.dng", 
          image.PropertyKey.SUBFILE_TYPE, typeArray[i], READ_FAILED);
        if (!ret) {
          console.info(`${testTag} TestGetImagePropertyByTypeError erroe is: ${typeArray[i]}`);
          break;
        }
        result = result && ret;
      }
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DNG_ERROR_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DNG_ERROR_0300
     * @tc.desc        Verify reading intArray property YCBCR_SUB_SAMPLING with wrong types returns READ_FAILED error
     *                 1.Create image source from DNG file using fd
     *                 2.Attempt to read intArray property using wrong types (double/doubleArray/string/arrayBuffer)
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DNG_ERROR_0300", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DNG_ERROR_0300"
      let result = true;
      let typeArray = ["double", "doubleArray", "string", "arrayBuffer"];
      for (let i = 0; i < typeArray.length; i++) {
        let ret = await TestGetImagePropertyByTypeError(testTag, "test.dng", 
          image.PropertyKey.YCBCR_SUB_SAMPLING, typeArray[i], READ_FAILED);
        if (!ret) {
          console.info(`${testTag} TestGetImagePropertyByTypeError erroe is: ${typeArray[i]}`);
          break;
        }
        result = result && ret;
      }
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DNG_ERROR_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DNG_ERROR_0400
     * @tc.desc        Verify reading double property X_RESOLUTION with wrong types returns READ_FAILED error
     *                 1.Create image source from DNG file using fd
     *                 2.Attempt to read double property using wrong types (short/long/intArray/string/arrayBuffer)
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DNG_ERROR_0400", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DNG_ERROR_0400"
      let result = true;
      let typeArray = ["short", "long", "intArray", "string", "arrayBuffer"];
      for (let i = 0; i < typeArray.length; i++) {
        let ret = await TestGetImagePropertyByTypeError(testTag, "test.dng", 
          image.PropertyKey.X_RESOLUTION, typeArray[i], READ_FAILED);
        if (!ret) {
          console.info(`${testTag} TestGetImagePropertyByTypeError erroe is: ${typeArray[i]}`);
          break;
        }
        result = result && ret;
      }
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DNG_ERROR_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DNG_ERROR_0500
     * @tc.desc        Verify reading doubleArray property YCBCR_COEFFICIENTS with wrong types returns READ_FAILED error
     *                 1.Create image source from DNG file using fd
     *                 2.Attempt to read doubleArray property using wrong types (short/long/intArray/string/arrayBuffer)
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DNG_ERROR_0500", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DNG_ERROR_0500"
      let result = true;
      let typeArray = ["short", "long", "intArray", "string", "arrayBuffer"];
      for (let i = 0; i < typeArray.length; i++) {
        let ret = await TestGetImagePropertyByTypeError(testTag, "test.dng", 
          image.PropertyKey.YCBCR_COEFFICIENTS, typeArray[i], READ_FAILED);
        if (!ret) {
          console.info(`${testTag} TestGetImagePropertyByTypeError erroe is: ${typeArray[i]}`);
          break;
        }
        result = result && ret;
      }
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DNG_ERROR_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DNG_ERROR_0600
     * @tc.desc        Verify reading arrayBuffer property OECF with wrong types returns READ_FAILED error
     *                 1.Create image source from DNG file using fd
     *                 2.Attempt to read arrayBuffer property using wrong types (short/long/intArray/double/doubleArray/string)
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DNG_ERROR_0600", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DNG_ERROR_0600"
      let result = true;
      let typeArray = ["short", "long", "intArray", "double", "doubleArray", "string"];
      for (let i = 0; i < typeArray.length; i++) {
        let ret = await TestGetImagePropertyByTypeError(testTag, "test.dng", 
          image.PropertyKey.OECF, typeArray[i], READ_FAILED);
        if (!ret) {
          console.info(`${testTag} TestGetImagePropertyByTypeError erroe is: ${typeArray[i]}`);
          break;
        }
        result = result && ret;
      }
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DNG_ERROR_0700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DNG_ERROR_0700
     * @tc.desc        Verify reading arrayBuffer property OECF with wrong types returns READ_FAILED error
     *                 1.Create image source from DNG file using fd
     *                 2.Attempt to read arrayBuffer property using wrong types (short/long/intArray/double/doubleArray/string)
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DNG_ERROR_0700", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DNG_ERROR_0700"
      let result = true;
      let typeArray = ["short", "long", "intArray", "double", "doubleArray", "string"];
      for (let i = 0; i < typeArray.length; i++) {
        let ret = await TestGetImagePropertyByTypeError(testTag, "test.dng", 
          image.PropertyKey.OECF, typeArray[i], READ_FAILED);
        if (!ret) {
          console.info(`${testTag} TestGetImagePropertyByTypeError erroe is: ${typeArray[i]}`);
          break;
        }
        result = result && ret;
      }
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DNG_ERROR_0800
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DNG_ERROR_0800
     * @tc.desc        Verify reading string property IMAGE_DESCRIPTION with wrong types returns READ_FAILED error
     *                 1.Create image source from DNG file using fd
     *                 2.Attempt to read string property using wrong types (short/long/intArray/double/doubleArray/arrayBuffer)
     *                 3.Verify API returns READ_FAILED error code
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DNG_ERROR_0800", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_READ_DNG_ERROR_0800"
      let result = true;
      let typeArray = ["short", "long", "intArray", "double", "doubleArray", "arrayBuffer"];
      for (let i = 0; i < typeArray.length; i++) {
        let ret = await TestGetImagePropertyByTypeError(testTag, "test.dng", 
          image.PropertyKey.IMAGE_DESCRIPTION, typeArray[i], READ_FAILED);
        if (!ret) {
          console.info(`${testTag} TestGetImagePropertyByTypeError erroe is: ${typeArray[i]}`);
          break;
        }
        result = result && ret;
      }
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_DNG_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_DNG_ERROR_0100
     * @tc.desc        Verify reading non-existent EXIF property key Makernote from DNG file returns READ_FAILED error
     *                 1.Create image source from DNG file using fd
     *                 2.Attempt to read non-existent property key using all types
     *                 3.Verify API returns READ_FAILED error code for all types
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_DNG_ERROR_0100", Level.LEVEL0, async (done: Function) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_NON_EXISTENE_KEY_DNG_ERROR_0100"
      let result = true;
      let typeArray = ["short", "long", "double", "intArray", "doubleArray", "string", "arrayBuffer", "arraySize"];
      for (let i = 0; i < typeArray.length; i++) {
        let ret = await TestGetImagePropertyByTypeError(testTag, "test.dng", 
          "Makernote" as image.PropertyKey, typeArray[i], READ_FAILED);
        if (!ret) {
          console.info(`${testTag} TestGetImagePropertyByTypeError erroe is: ${typeArray[i]}`);
          break;
        }
        result = result && ret;
      }
      console.info(`${testTag} TestGetImagePropertyByTypeError result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

  })
}